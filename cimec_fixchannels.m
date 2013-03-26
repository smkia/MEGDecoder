function [datarepaired] = cimec_fixchannels(cfg, data)

% CIMEC_FIXCHANNELS is a wrapper function that tries to get rid of the
% peculiar behavior of our Neuromag machine. Since we can have a high
% number of bad channels all over blocks/subjects/days of experiment, this
% function "wraps" some clever wizardry around FT_CHANNELREPAIR, finding
% the proper list of neighboouring channel to the ones that have to be
% fixed
%
% Use as
%   datarepaired = cimec_fixchannels(cfg, data)
%
% there are no mandatory fields for cfg, since it can take out all the
% relevant information from the data. 
% Optional arguments can be:
%
% cfg.distance     = distance in cm to be used to computer the neighbours, 
%                    if the method 'distance' is chosen (UNUSED)
% cfg.badchannel   = list of bad channels; default is [], and they will be 
%                    automagically detected as the missing channels in
%                    the data structure 
% cfg.method       = the method for calculating the distance used by 
%                    ft_prepare_neighbours, could be either 
%                    'distance', 'triangulation' or 'template' 
%                    (default = 'distance') (UNUSED)
%
% version 20120228 v3 implemente cfg.badchannel, in case of pre-existing
%                     bad channels list

% version 20120224 v2 corrected  allMEGlabel, now pointing to data.label
% version 20120222 v1 
% Copyright (C) 2012, Gianpaolo Demarchi



if ~isfield(cfg, 'distance'),    cfg.distance    = 4;   end
if ~isfield(cfg, 'badchannel'),     badChannel   = []; else badChannel=cfg.badchannel;  end

% TODO: test whethter 'triangulation' gives better results than 'distance'

if ~isfield(cfg, 'method'),    cfg.method    = 'triangulation';   end

defaultMethod = cfg.method;

% if there are bad channels defined, use those, otherwise check look for
% them in the list


% NOTE
% actual present channels are in channels data.cfg.channel
% all channels are stored in data.hdr.label


if ~isempty(badChannel)
    goodChannel = 306 - max(size(badChannel));
else
    goodChannel = max(size(data.label));
end


allMEGlabel = data.label(1:goodChannel);

% allMEGlabel represents all the really good channels present in the data,
% not the interpolated ones. This should be kept somewhere ... but I don't
% really know how to do the bookkeeping; we could either spit out another
% cfg, or find another way.

% get out the list of all channels, from the header

gradY.label = data.hdr.label(1:3:306);
gradX.label = data.hdr.label(2:3:306);
mag.label = data.hdr.label(3:3:306);

% and from there I've to get out my good guys
% intersecting them with the ones that I've actually

[a,loc] = ismember(gradY.label,allMEGlabel);
gradY.goodLabel = gradY.label(find(loc));

[a,loc] = ismember(gradX.label,allMEGlabel);
gradX.goodLabel = gradX.label(find(loc));

[a,loc] = ismember(mag.label,allMEGlabel);
mag.goodLabel = mag.label(find(loc));


if isempty(badChannel)
    % search manually for missing channels
    missingGradY = setdiff(gradY.label,allMEGlabel);
    missingGradX = setdiff(gradX.label,allMEGlabel);
    missingMag = setdiff(mag.label,allMEGlabel);
    
else
    % get them from the list passed
    missingGradY = gradY.label(ismember(gradY.label,badChannel));
    missingGradX = gradX.label(ismember(gradX.label,badChannel));
    missingMag = mag.label(ismember(mag.label,badChannel));
end

% take the exact position of the sensor

if isfield(data,'grad')

position = data.grad.chanpos(1:306,:);
gradY.chanpos = position(1:102,:);
gradX.chanpos = position(1:102,:);
mag.chanpos  = position(1:102,:);




cfg=[];
cfg.grad=gradY;
cfg.method=defaultMethod;
neighbGradY=ft_prepare_neighbours(cfg);



cfg=[];
cfg.grad=gradX;
cfg.method=defaultMethod;
neighbGradX=ft_prepare_neighbours(cfg);

cfg=[];
cfg.grad=mag;
cfg.method=defaultMethod;
neighbMag=ft_prepare_neighbours(cfg);

isgrad=1;

else
    load Cimec_MEG_neigh.mat %file should be stored in path
    data.grad=data.hdr.grad; %needs to be added for ft_channelrepair
    isgrad=0;
end


cfg=[];

if isempty(badChannel)
    cfg.missingchannel =[ missingGradY ; missingGradX ; missingMag] ;
else
    cfg.badchannel =[ missingGradY ; missingGradX ; missingMag] ;
end

cfg.neighbours     = [ neighbGradY neighbGradX neighbMag];  %neighbourhoodstructure, see also FT_PREPARE_NEIGHBOURS
datarepaired = ft_channelrepair(cfg, data);

% Add another field in datarepaired, to keep track of the originally good
% channels

datarepaired.origLabel = allMEGlabel;

if isgrad==0
datarepaired=rmfield(datarepaired,'grad');
end

% is there still any difference?
% data.hdr.label(find(~ismember(data.hdr.label(1:1:306),datarepairedtmp.label)))

end
