function data = reorder_channels(data)

% data = reorder_channels(data)
%
% checks if channels in the data are in the default (Neuromag) order,
% if not, labels and data are reordered
%
% if data are ordered as default, nothing happens
%
% input:
%
% data - fieldtrip struct containing either ERF or time-frequency data,
%        output of ft_freqanalysis, ft_timelockanalysis
%
% output:
%
% data - data with reordered labels and powspctrm/trials/avg/var fields
%        (whatever is present in the data)

%
% copyright (c), 2013, P. Ruhnau, philipp_ruhnau@yahoo.de, 2013-02-12

if numel(data.label) > 204 && numel(data.label) <= 306
    disp('Assuming standard 306 channel Neuromag layout')
    % standard NEUROMAG channel order
    standard_label = {'MEG0113'    'MEG0112'    'MEG0111'    'MEG0122'    'MEG0123'    'MEG0121'    'MEG0132'    'MEG0133'    'MEG0131'    'MEG0143'    'MEG0142'    'MEG0141'    'MEG0213'    'MEG0212'...
        'MEG0211'    'MEG0222'    'MEG0223'    'MEG0221'    'MEG0232'    'MEG0233'    'MEG0231'    'MEG0243'    'MEG0242'    'MEG0241'    'MEG0313'    'MEG0312'    'MEG0311'    'MEG0322'...
        'MEG0323'    'MEG0321'    'MEG0333'    'MEG0332'    'MEG0331'    'MEG0343'    'MEG0342'    'MEG0341'    'MEG0413'    'MEG0412'    'MEG0411'    'MEG0422'    'MEG0423'    'MEG0421'...
        'MEG0432'    'MEG0433'    'MEG0431'    'MEG0443'    'MEG0442'    'MEG0441'    'MEG0513'    'MEG0512'    'MEG0511'    'MEG0523'    'MEG0522'    'MEG0521'    'MEG0532'    'MEG0533'...
        'MEG0531'    'MEG0542'    'MEG0543'    'MEG0541'    'MEG0613'    'MEG0612'    'MEG0611'    'MEG0622'    'MEG0623'    'MEG0621'    'MEG0633'    'MEG0632'    'MEG0631'    'MEG0642'...
        'MEG0643'    'MEG0641'    'MEG0713'    'MEG0712'    'MEG0711'    'MEG0723'    'MEG0722'    'MEG0721'    'MEG0733'    'MEG0732'    'MEG0731'    'MEG0743'    'MEG0742'    'MEG0741'...
        'MEG0813'    'MEG0812'    'MEG0811'    'MEG0822'    'MEG0823'    'MEG0821'    'MEG0913'    'MEG0912'    'MEG0911'    'MEG0923'    'MEG0922'    'MEG0921'    'MEG0932'    'MEG0933'...
        'MEG0931'    'MEG0942'    'MEG0943'    'MEG0941'    'MEG1013'    'MEG1012'    'MEG1011'    'MEG1023'    'MEG1022'    'MEG1021'    'MEG1032'    'MEG1033'    'MEG1031'    'MEG1043'...
        'MEG1042'    'MEG1041'    'MEG1112'    'MEG1113'    'MEG1111'    'MEG1123'    'MEG1122'    'MEG1121'    'MEG1133'    'MEG1132'    'MEG1131'    'MEG1142'    'MEG1143'    'MEG1141'...
        'MEG1213'    'MEG1212'    'MEG1211'    'MEG1223'    'MEG1222'    'MEG1221'    'MEG1232'    'MEG1233'    'MEG1231'    'MEG1243'    'MEG1242'    'MEG1241'    'MEG1312'    'MEG1313'...
        'MEG1311'    'MEG1323'    'MEG1322'    'MEG1321'    'MEG1333'    'MEG1332'    'MEG1331'    'MEG1342'    'MEG1343'    'MEG1341'    'MEG1412'    'MEG1413'    'MEG1411'    'MEG1423'...
        'MEG1422'    'MEG1421'    'MEG1433'    'MEG1432'    'MEG1431'    'MEG1442'    'MEG1443'    'MEG1441'    'MEG1512'    'MEG1513'    'MEG1511'    'MEG1522'    'MEG1523'    'MEG1521'...
        'MEG1533'    'MEG1532'    'MEG1531'    'MEG1543'    'MEG1542'    'MEG1541'    'MEG1613'    'MEG1612'    'MEG1611'    'MEG1622'    'MEG1623'    'MEG1621'    'MEG1632'    'MEG1633'...
        'MEG1631'    'MEG1643'    'MEG1642'    'MEG1641'    'MEG1713'    'MEG1712'    'MEG1711'    'MEG1722'    'MEG1723'    'MEG1721'    'MEG1732'    'MEG1733'    'MEG1731'    'MEG1743'...
        'MEG1742'    'MEG1741'    'MEG1813'    'MEG1812'    'MEG1811'    'MEG1822'    'MEG1823'    'MEG1821'    'MEG1832'    'MEG1833'    'MEG1831'    'MEG1843'    'MEG1842'    'MEG1841'...
        'MEG1912'    'MEG1913'    'MEG1911'    'MEG1923'    'MEG1922'    'MEG1921'    'MEG1932'    'MEG1933'    'MEG1931'    'MEG1943'    'MEG1942'    'MEG1941'    'MEG2013'    'MEG2012'...
        'MEG2011'    'MEG2023'    'MEG2022'    'MEG2021'    'MEG2032'    'MEG2033'    'MEG2031'    'MEG2042'    'MEG2043'    'MEG2041'    'MEG2113'    'MEG2112'    'MEG2111'    'MEG2122'...
        'MEG2123'    'MEG2121'    'MEG2133'    'MEG2132'    'MEG2131'    'MEG2143'    'MEG2142'    'MEG2141'    'MEG2212'    'MEG2213'    'MEG2211'    'MEG2223'    'MEG2222'    'MEG2221'...
        'MEG2233'    'MEG2232'    'MEG2231'    'MEG2242'    'MEG2243'    'MEG2241'    'MEG2312'    'MEG2313'    'MEG2311'    'MEG2323'    'MEG2322'    'MEG2321'    'MEG2332'    'MEG2333'...
        'MEG2331'    'MEG2343'    'MEG2342'    'MEG2341'    'MEG2412'    'MEG2413'    'MEG2411'    'MEG2423'    'MEG2422'    'MEG2421'    'MEG2433'    'MEG2432'    'MEG2431'    'MEG2442'...
        'MEG2443'    'MEG2441'    'MEG2512'    'MEG2513'    'MEG2511'    'MEG2522'    'MEG2523'    'MEG2521'    'MEG2533'    'MEG2532'    'MEG2531'    'MEG2543'    'MEG2542'    'MEG2541'...
        'MEG2612'    'MEG2613'    'MEG2611'    'MEG2623'    'MEG2622'    'MEG2621'    'MEG2633'    'MEG2632'    'MEG2631'    'MEG2642'    'MEG2643'    'MEG2641'}';
elseif numel(data.label) <= 204
    disp('Assuming standard 204 channel Neuromag layout with combined gradiometers')
    % NEUROMAG channel order after fieldtrip combined gradiometers
    standard_label = {'MEG0112+0113'    'MEG0122+0123'    'MEG0132+0133'    'MEG0142+0143'    'MEG0212+0213'    'MEG0222+0223'    'MEG0232+0233'    'MEG0242+0243'    'MEG0312+0313'    'MEG0322+0323'...
        'MEG0332+0333'    'MEG0342+0343'    'MEG0412+0413'    'MEG0422+0423'    'MEG0432+0433'    'MEG0442+0443'    'MEG0512+0513'    'MEG0522+0523'    'MEG0532+0533'    'MEG0542+0543'...
        'MEG0612+0613'    'MEG0622+0623'    'MEG0632+0633'    'MEG0642+0643'    'MEG0712+0713'    'MEG0722+0723'    'MEG0732+0733'    'MEG0742+0743'    'MEG0812+0813'    'MEG0822+0823'...
        'MEG0912+0913'    'MEG0922+0923'    'MEG0932+0933'    'MEG0942+0943'    'MEG1012+1013'    'MEG1022+1023'    'MEG1032+1033'    'MEG1042+1043'    'MEG1112+1113'    'MEG1122+1123'...
        'MEG1132+1133'    'MEG1142+1143'    'MEG1212+1213'    'MEG1222+1223'    'MEG1232+1233'    'MEG1242+1243'    'MEG1312+1313'    'MEG1322+1323'    'MEG1332+1333'    'MEG1342+1343'...
        'MEG1412+1413'    'MEG1422+1423'    'MEG1432+1433'    'MEG1442+1443'    'MEG1512+1513'    'MEG1522+1523'    'MEG1532+1533'    'MEG1542+1543'    'MEG1612+1613'    'MEG1622+1623'...
        'MEG1632+1633'    'MEG1642+1643'    'MEG1712+1713'    'MEG1722+1723'    'MEG1732+1733'    'MEG1742+1743'    'MEG1812+1813'    'MEG1822+1823'    'MEG1832+1833'    'MEG1842+1843'...
        'MEG1912+1913'    'MEG1922+1923'    'MEG1932+1933'    'MEG1942+1943'    'MEG2012+2013'    'MEG2022+2023'    'MEG2032+2033'    'MEG2042+2043'    'MEG2112+2113'    'MEG2122+2123'...
        'MEG2132+2133'    'MEG2142+2143'    'MEG2212+2213'    'MEG2222+2223'    'MEG2232+2233'    'MEG2242+2243'    'MEG2312+2313'    'MEG2322+2323'    'MEG2332+2333'    'MEG2342+2343'...
        'MEG2412+2413'    'MEG2422+2423'    'MEG2432+2433'    'MEG2442+2443'    'MEG2512+2513'    'MEG2522+2523'    'MEG2532+2533'    'MEG2542+2543'    'MEG2612+2613'    'MEG2622+2623'...
        'MEG2632+2633'    'MEG2642+2643'    'MEG0111'    'MEG0121'    'MEG0131'    'MEG0141'    'MEG0211'    'MEG0221'    'MEG0231'    'MEG0241'    'MEG0311'    'MEG0321'    'MEG0331'...
        'MEG0341'    'MEG0411'    'MEG0421'    'MEG0431'    'MEG0441'    'MEG0511'    'MEG0521'    'MEG0531'    'MEG0541'    'MEG0611'    'MEG0621'    'MEG0631'    'MEG0641'    'MEG0711'...
        'MEG0721'    'MEG0731'    'MEG0741'    'MEG0811'    'MEG0821'    'MEG0911'    'MEG0921'    'MEG0931'    'MEG0941'    'MEG1011'    'MEG1021'    'MEG1031'    'MEG1041'    'MEG1111'...
        'MEG1121'    'MEG1131'    'MEG1141'    'MEG1211'    'MEG1221'    'MEG1231'    'MEG1241'    'MEG1311'    'MEG1321'    'MEG1331'    'MEG1341'    'MEG1411'    'MEG1421'    'MEG1431'...
        'MEG1441'    'MEG1511'    'MEG1521'    'MEG1531'    'MEG1541'    'MEG1611'    'MEG1621'    'MEG1631'    'MEG1641'    'MEG1711'    'MEG1721'    'MEG1731'    'MEG1741'    'MEG1811'...
        'MEG1821'    'MEG1831'    'MEG1841'    'MEG1911'    'MEG1921'    'MEG1931'    'MEG1941'    'MEG2011'    'MEG2021'    'MEG2031'    'MEG2041'    'MEG2111'    'MEG2121'    'MEG2131'...
        'MEG2141'    'MEG2211'    'MEG2221'    'MEG2231'    'MEG2241'    'MEG2311'    'MEG2321'    'MEG2331'    'MEG2341'    'MEG2411'    'MEG2421'    'MEG2431'    'MEG2441'    'MEG2511'...
        'MEG2521'    'MEG2531'    'MEG2541'    'MEG2611'    'MEG2621'    'MEG2631'    'MEG2641'}';
else
    error('cimec:reorder_channels:channum_exceeded','Input data type unknown. \nData can have no more than 306 channels.')
end % if

% compare standard and current label order
[~,a_idx,re_idx] = intersect(standard_label,data.label, 'stable');

% Matlab versions earlier than 2012 don't have a stable option, therefore reordering is needed
% we check if a_idx is sorted (if so, the stable option did work)
if ~issorted(a_idx)
    % undo the sorting
    [a_sort a_map] = sort(a_idx); %#ok<ASGLU>
    re_idx = re_idx(a_map);
    % for completion labels
    % sorted_labels = standard_label(a_ind);
end


if issorted(re_idx) %if sorted correctly get out
    disp('Channels are in right order, data untouched')
    return
end % if

% reordering
if isfield(data, 'trial') % ERFs
    switch data.dimord
        case 'rpt_chan_time'
            data.trial = data.trial(:,re_idx,:);
        case 'chan_time'
            data.trial = data.trial(re_idx,:);
    end %switch
elseif isfield(data, 'avg') % if there is an average
    switch data.dimord
        case 'chan_time'
            data.avg = data.avg(re_idx, :);
            if isfield(data, 'var')
                data.var = data.var(reidx,:);
            end
        case 'chan_freq_time'
            data.avg = data.avg(re_idx, :, :);
            if isfield(data, 'var')
                data.var = data.var(reidx, :,:);
            end
    end
elseif isfield(data, 'powspctrm') % tf data
    switch data.dimord
        case 'rpt_chan_freq_time'
            data.powspctrm = data.powspctrm(:,re_idx,:,:);
        case 'chan_freq_time'
            data.powspctrm = data.powspctrm(re_idx,:,:);
    end % switch
else
    error('cimec:reorder_channels:unknown_dataformat','Input data type unknown. \nFunction can currently only deal with erfs or time-frequency data.\n(Results of ft_frequanalysis or ft_timelockanalysis)')
end % if
data.label = data.label(re_idx);

end % function