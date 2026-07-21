/* Self-contained variant of Projectpart2.sas: the season_data set is built
   inline with DATALINES instead of PROC IMPORT, so this script runs on its own
   (e.g. via /v1/quick) with no external CSV. The PRINT/MEANS/FREQ/CORR/SGPLOT
   analysis below is unchanged from the original. */
DATA season_data;
    LENGTH title $16 result $1;
    INPUT title $ result $ xG xGA npxG npxGA scored missed wins draws loses pts;
    DATALINES;
RealMadrid w 2.41 0.78 2.18 0.71 3 0 1 0 0 3
Barcelona w 2.15 0.92 1.98 0.85 2 1 1 0 0 3
Atletico d 1.34 1.28 1.20 1.15 1 1 0 1 0 1
RealSociedad w 1.87 1.02 1.71 0.94 2 0 1 0 0 3
RealBetis l 1.11 1.96 1.04 1.82 0 2 0 0 1 0
Villarreal d 1.45 1.41 1.33 1.29 1 1 0 1 0 1
AthleticClub w 1.72 0.88 1.60 0.81 2 0 1 0 0 3
Valencia l 0.94 2.33 0.87 2.18 1 3 0 0 1 0
Sevilla d 1.28 1.31 1.19 1.22 1 1 0 1 0 1
CeltaVigo l 1.02 2.05 0.95 1.91 0 2 0 0 1 0
Getafe w 1.19 0.74 1.08 0.68 1 0 1 0 0 3
Osasuna d 1.33 1.37 1.24 1.28 2 2 0 1 0 1
RayoVallecano w 1.56 1.14 1.42 1.05 2 1 1 0 0 3
Espanyol l 0.88 1.79 0.82 1.66 0 2 0 0 1 0
Mallorca d 1.07 1.12 0.99 1.04 1 1 0 1 0 1
Girona w 1.64 1.21 1.51 1.12 2 1 1 0 0 3
Cadiz l 0.79 1.88 0.73 1.74 0 2 0 0 1 0
Almeria l 1.13 2.14 1.05 1.99 1 3 0 0 1 0
Valladolid d 1.22 1.26 1.13 1.17 1 1 0 1 0 1
Elche l 0.85 2.01 0.79 1.87 0 2 0 0 1 0
;
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
