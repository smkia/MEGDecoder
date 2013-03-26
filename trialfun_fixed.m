function [trl, event] = trialfun_fixed(cfg)


if isfield(cfg.trialdef, 'eventvalue')  && isempty(cfg.trialdef.eventvalue   ), cfg.trialdef = rmfield(cfg.trialdef, 'eventvalue' ); end
if isfield(cfg.trialdef, 'prestim')     && isempty(cfg.trialdef.prestim      ), cfg.trialdef = rmfield(cfg.trialdef, 'prestim'    ); end
if isfield(cfg.trialdef, 'poststim')    && isempty(cfg.trialdef.poststim     ), cfg.trialdef = rmfield(cfg.trialdef, 'poststim'   ); end
if isfield(cfg.trialdef, 'triallength') && isempty(cfg.trialdef.triallength  ), cfg.trialdef = rmfield(cfg.trialdef, 'triallength'); end
if isfield(cfg.trialdef, 'ntrials')     && isempty(cfg.trialdef.ntrials      ), cfg.trialdef = rmfield(cfg.trialdef, 'ntrials'    ); end

% read the header information and the events from the data
hdr   = ft_read_header(cfg.dataset);
event = ft_read_event(cfg.dataset);

% sel = find(strcmp(eventtype{i}, {event.type}));
% eventvalue = unique(mod(cell2mat({event(sel).value}),256))

sel = [];
trl = [];
val = [];

if strcmp(cfg.trialdef.eventtype, '?')
    % no trials should be added, show event information using subfunction and exit
    eventtype = unique({event.type});
    Neventtype = length(eventtype);
    if Neventtype==0
        fprintf('no events were found in the datafile\n');
    else
        
        fprintf('the following events were found in the datafile\n');
        for i=1:Neventtype
            sel = find(strcmp(eventtype{i}, {event.type}));
            try
                eventvalue = unique({event(sel).value});            % cell-array with string value
                eventvalue = sprintf('''%s'' ', eventvalue{:});     % translate into a single string
            catch
                eventvalue = unique(cell2mat({event(sel).value}));  % array with numeric values or empty
                eventvalue = num2str(eventvalue);                   % translate into a single string
            end
            fprintf('event type: ''%s'' ', eventtype{i});
            fprintf('with event values: %s', eventvalue);
            fprintf('\n');
        end
        
        fprintf('\nFixing STI101 will lead to the following values:\n');
        
        for i=1:Neventtype
            sel = find(strcmp(eventtype{i}, {event.type}));
            try
                eventvalue = unique({event(sel).value});            % cell-array with string value
                eventvalue = sprintf('''%s'' ', eventvalue{:});     % translate into a single string
            catch
                eventvalue = unique(mod(cell2mat({event(sel).value}),256));  % array with numeric values or empty
                eventvalue = num2str(eventvalue);                   % translate into a single string
            end
            fprintf('event type: ''%s'' ', eventtype{i});
            fprintf('with event values: %s', eventvalue);
            fprintf('\n');
        end
        
        return
    end
end


   
% search for "trigger" events
value  = [event(strcmp(cfg.trialdef.eventtype , {event.type})).value]';
sample = [event(strcmp(cfg.trialdef.eventtype , {event.type})).sample]';


% determine the number of samples before and after the trigger
if isfield(cfg.trialdef, 'prestim') &&  isfield(cfg.trialdef, 'poststim')
    pretrig  = -round(cfg.trialdef.prestim  * hdr.Fs);
    posttrig =  round(cfg.trialdef.poststim * hdr.Fs);
else
    pretrig  = 0;
    posttrig = 0;
end

% correct for the higher bits  !!!
value=mod(value,256);

% for each trigger except the last one
trl = [];
for j = 1:length(value)
    
    %if value(j) == cfg.trialdef.eventvalue
    if ismember(value(j),cfg.trialdef.eventvalue)
        
        trlbegin = sample(j) + pretrig;
        trlend   = sample(j) + posttrig;
        offset   = pretrig;
        newtrl   = [trlbegin trlend offset];
        trl      = [trl; newtrl];
    else
        
    end
    
end
%event.value=value;
fprintf(1,'I''ve found %d trials with the following (corrected) code(s): %s\n', size(trl,1),mat2str(cfg.trialdef.eventvalue))

end


