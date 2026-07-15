% See Prog_10a.m when downloading the programs.
% Load data from Excel.
T=readtable('Data-1-OCR.xlsx','Sheet','Data','VariableNamingRule',...
     'preserve');
% Clean the Data.
T_clean=rmmissing(T,'DataVariables', ...
   {'Life expectancy at birth 1960', ...
    'Life expectancy at birth 2010', ...
    'GDP per capita (US$)'});
% Number of rows before and after cleaning.
fprintf('Original rows: %d\n', height(T));
fprintf('Rows after cleaning: %d\n', height(T_clean));
% Preprocess the Data.
% Prevent scientific notation where possible.
format long g
% Create Life Expectancy Change feature.
T_clean.("Life expectancy change 1960 to 2010") = ...
T_clean.("Life expectancy at birth 2010") - ...
T_clean.("Life expectancy at birth 1960");
% Create Income Category feature.
T_clean.("Income Category")=categorical( ...
T_clean.("GDP per capita (US$)")>12376,[false true],{'Low','High'});
% Display the first 5 rows and columns of interest.
head(T_clean(:,[1 2 15 20 21 22]),5)
size(T_clean)
summary(T_clean)
% Save updated dataset.
writetable(T,'Data-1-OCR-Updated.xlsx');
disp(' ')
disp('Updated dataset saved as Data-1-OCR-Updated.xlsx')
% End Prog_10a.m.