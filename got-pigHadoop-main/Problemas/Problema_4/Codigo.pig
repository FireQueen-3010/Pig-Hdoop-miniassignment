eps = LOAD './got_imdb.csv' USING PigStorage(',') AS (season:int, episode:int, date:chararray, title:chararray, Rating:float, count:int, descricao:chararray);
dts = FOREACH eps GENERATE FLATTEN(STRSPLIT($2, ' ', 3)) AS (day:chararray,month:chararray,year:chararray), count;

months = GROUP dts by month;
result = FOREACH months GENERATE group as month, SUM(dts.count);
DUMP result;
STORE result INTO 'c:/output9';