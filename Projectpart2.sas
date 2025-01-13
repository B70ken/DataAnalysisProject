/* Import the CSV file */
PROC IMPORT DATAFILE="/home/u63992287/sasuser.v94/season.csv"
    OUT=season_data
    DBMS=CSV
    REPLACE;
    GETNAMES=YES;
RUN;

/* View the first few rows of the dataset */
PROC PRINT DATA=season_data (OBS=10);
RUN;

/* Descriptive Statistics */
PROC MEANS DATA=season_data N MEAN MEDIAN STD MIN MAX;
    VAR xG xGA npxG npxGA scored missed wins draws loses pts;
RUN;

/* Frequency distribution of results and teams */
PROC FREQ DATA=season_data;
    TABLES result title;
RUN;

/* Correlation Analysis */
PROC CORR DATA=season_data;
    VAR xG xGA npxG npxGA scored missed wins draws loses pts;
RUN;

/* Histogram for Expected Goals (xG) */
PROC SGPLOT DATA=season_data;
    HISTOGRAM xG;
    DENSITY xG;
    TITLE "Histogram of Expected Goals (xG)";
RUN;

/* Scatter Plot between Expected Goals (xG) and Scored Goals */
PROC SGPLOT DATA=season_data;
    SCATTER X=xG Y=scored;
    TITLE "Scatter Plot of Expected Goals (xG) vs Scored Goals";
RUN;
