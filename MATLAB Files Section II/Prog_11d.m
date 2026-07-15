% Prog_11d.m: ENSO (ONI) Data Analysis
% Counts actual ENSO EVENTS using NOAA's definition:
% An El Niño or La Niña event must persist for at least
% five consecutive overlapping 3-month seasons.
% Load the ONI data set.
filename='ONI.xlsx';
T=readtable(filename,'VariableNamingRule','preserve');
years=T.Year;
oni=T{:,2:end};
% Convert to numeric (handles text/blank cells).
oni=str2double(string(oni));
% Keep missing values as NaN.
oni(isnan(oni))=NaN;
% Dimensions.
[nYears,nSeasons]=size(oni);
seasonNames=T.Properties.VariableNames(2:end);
% Optional smoothing (5-point moving average).
oni_smooth=movmean(oni,5,1,'omitnan');
% ENSO classification thresholds.
elNinoThreshold=0.5;
laNinaThreshold=-0.5;
% Classify each ONI value.
ensoPhase=strings(nYears,nSeasons);
for i=1:nYears
    for j=1:nSeasons
        % Use original ONI values.
        val=oni(i,j);
        % To classify smoothed data instead, use:
        % val = oni_smooth(i,j);
        if isnan(val)
            ensoPhase(i,j)="Missing";
        elseif val >= elNinoThreshold
            ensoPhase(i,j)="El Niño";
        elseif val <= laNinaThreshold
            ensoPhase(i,j)="La Niña";
        else
            ensoPhase(i,j)="Neutral";
        end
    end
end
% Add phase columns to table.
for j=1:nSeasons
    newName=matlab.lang.makeValidName( ...
        [seasonNames{j} '_Phase']);
    T.(newName)=ensoPhase(:,j);
end
% Compute yearly mean ONI.
T.YearMeanONI=mean(oni,2,'omitnan');
% Plot heatmap.
figure
imagesc(oni)
colormap(jet)
colorbar
xticks(1:nSeasons)
xticklabels(seasonNames)
xtickangle(45)
yearStep = 10;
ytickYears=years(1):yearStep:years(end);
ytickPos=interp1(years,1:nYears,...
                   ytickYears,'nearest');
yticks(ytickPos)
yticklabels(ytickYears)
xlabel('Season')
ylabel('Year')
title('ONI Seasonal Values Heatmap')
set(gca,'FontSize',20)
% COUNT ACTUAL ENSO EVENTS (NOAA definition).
% Convert matrix to one chronological time series.
oniVec=oni';
% Convert from 12 x N matrix to a single column vector.
oniVec=oniVec(:);
% Remove missing values
oniVec=oniVec(~isnan(oniVec));
elMask=oniVec >= elNinoThreshold;
d=diff([false; elMask; false]);
startIdx=find(d == 1);
endIdx=find(d == -1)-1;
duration=endIdx - startIdx + 1;
elNinoCount=sum(duration >= 5);
laMask=oniVec <= laNinaThreshold;
d=diff([false; laMask; false]);
startIdx=find(d == 1);
endIdx=find(d == -1)-1;
duration=endIdx - startIdx + 1;
laNinaCount=sum(duration >= 5);
neutralMask=abs(oniVec) < elNinoThreshold;
d=diff([false; neutralMask; false]);
startIdx=find(d == 1);
endIdx=find(d == -1) - 1;
duration=endIdx - startIdx + 1;
neutralCount=numel(duration);
% Display summary.
fprintf('\n===== ENSO EVENT SUMMARY =====\n');
fprintf('El Niño events      : %d\n', elNinoCount);
fprintf('La Niña events      : %d\n', laNinaCount);
fprintf('Neutral periods     : %d\n', neutralCount);
fprintf('Valid ONI records   : %d\n', numel(oniVec));
% Save processed table.
writetable(T,'ONI_Processed.xlsx');
disp('Analysis complete.')
disp('Output saved to ONI_Processed.xlsx.')
% End Prog_11d.m.