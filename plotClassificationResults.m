function [hbar, herr, thispt] = plotClassificationResults(mat, matse, varargin)

thispt = [];
[ncols, nrows]=size(mat);
if isempty(varargin)
    Cfg = [];
else
    Cfg = varargin{1};
end
if  ~isfield(Cfg, 'oneColorPerBar'), Cfg.oneColorPerBar = 0; else cmap = jet(ncols); end;
if  ~isfield(Cfg, 'oneColor'), Cfg.oneColor = 1; else end;
if  ~isfield(Cfg, 'errorBarColor'), Cfg.errorBarColor = 'k'; else end;
if  ~isfield(Cfg, 'wiplotClassificationResultsdth'), Cfg.width = 0.5; else end;

% mat=[2 2 1 1; 1 2 nan nan]';
% matse=[0.25 0.25 0.25 0.25; 0.25 0.25 0.25 0.25]';


% hbar = bar('v6', mat, 0.5, 'w');
% set(hbar, 'FaceColor', [.6 .6 .6])
warning off all
if Cfg.oneColorPerBar
    
    for iCol = 1 : ncols
        %hbar(iCol) = bar(iCol, mat(iCol), 0.5, 'FaceColor', cmap(iCol, :), 'width', Cfg.width);
        hbar(iCol) = bar(iCol, mat(iCol), Cfg.width, 'FaceColor', cmap(iCol, :));
        hold on
    end
    
    
    set(gca, 'xlim', [0, ncols+1], 'xtick', 1:ncols)
    herr = errorbar(1:ncols, mat, matse, 'linestyle', 'none', 'color', 'k', 'linewidth', 2);
    hold off
    %legend(hbar, 1:ncols, 'Location','NorthEastOutside')
else
    
    hbar = bar('v6', mat, Cfg.width);
    if Cfg.oneColor
        set(hbar, 'FaceColor', [.6 .6 .6])
    end
    hold on;
    thispt = mean(get(hbar, 'xdata'));
    for i=1:nrows
        
        herr(i) = errorbar(thispt(:,i), mat(:,i), matse(:,i));
        set(herr(i), 'linestyle', 'none', 'linewidth', 2, 'color', Cfg.errorBarColor);
        hold on;
    end
    hold off
end
warning on all
