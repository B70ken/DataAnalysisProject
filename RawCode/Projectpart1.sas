/* Import the CSV file */
PROC IMPORT DATAFILE="/home/u63992287/sasuser.v94/player.csv"
    OUT=player_data
    DBMS=CSV
    REPLACE;
    GETNAMES=YES;
RUN;

/* View the first few rows of the dataset */
PROC PRINT DATA=player_data (OBS=10);
RUN;

/* Descriptive Statistics */
PROC MEANS DATA=player_data N MEAN MEDIAN STD MIN MAX;
    VAR games goals xG assists shots key_passes yellow_cards red_cards;
RUN;

/* Frequency distribution of position and team_title */
PROC FREQ DATA=player_data;
    TABLES position team_title;
RUN;

/* Correlation Analysis */
PROC CORR DATA=player_data;
    VAR games goals xG assists shots key_passes yellow_cards red_cards;
RUN;

/* Histogram for Goals */
PROC SGPLOT DATA=player_data;
    HISTOGRAM goals;
    DENSITY goals;
    TITLE "Histogram of Goals";
RUN;

/* Scatter Plot between Goals and xG */
PROC SGPLOT DATA=player_data;
    SCATTER X=xG Y=goals;
    TITLE "Scatter Plot of Goals vs Expected Goals (xG)";
RUN;

