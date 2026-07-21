/* Self-contained variant of Projectpart1.sas: the player_data set is built
   inline with DATALINES instead of PROC IMPORT, so this script runs on its own
   (e.g. via /v1/quick) with no external CSV. The PRINT/MEANS/FREQ/CORR/SGPLOT
   analysis below is unchanged from the original. */
DATA player_data;
    LENGTH player_name $20 team_title $16 position $4;
    INPUT player_name $ team_title $ position $ games goals xG assists shots key_passes yellow_cards red_cards;
    DATALINES;
Lewandowski Barcelona F 34 23 25.14 7 132 38 3 0
Griezmann Atletico F 36 16 14.87 4 101 45 5 0
Benzema RealMadrid F 32 19 18.92 6 118 31 2 0
Vinicius RealMadrid FM 33 15 12.44 9 96 74 4 0
Aspas CeltaVigo FM 31 12 11.03 5 84 52 6 1
Joselu Espanyol F 33 14 13.71 2 79 18 4 0
Iglesias RealBetis F 35 10 12.55 3 72 27 7 0
Moreno Villarreal F 20 9 8.44 4 51 22 1 0
Unal Getafe F 27 11 9.87 1 68 14 5 0
DeTomas RayoVallecano F 32 12 10.19 2 75 20 3 0
Morata Atletico FS 32 13 12.66 4 70 25 6 0
Oyarzabal RealSociedad FM 29 10 9.31 6 64 58 2 0
Isco RealMadrid M 21 3 2.87 4 29 41 1 0
Llorente Atletico M 34 7 6.12 5 58 63 8 0
Pedri Barcelona M 32 6 5.44 7 44 89 3 0
DeJong Barcelona M 30 4 3.98 3 37 71 5 0
Canales RealBetis M 33 8 7.22 6 61 97 4 0
Kubo Getafe M 32 3 4.11 2 55 48 2 0
Carrasco Atletico M 31 5 5.87 7 49 66 6 0
Parejo Villarreal M 34 6 4.73 4 52 81 9 0
;
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
