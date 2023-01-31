A = LOAD './got_imdb.csv' USING PigStorage(',') AS (season:int, episode:int, date:chararray, title:chararray, Rating:float, count:int, descricao:chararray);
B = FOREACH A GENERATE $0, $4;
C = GROUP B BY season;
D = FOREACH C GENERATE group as season, SUM(B.Rating)/COUNT(B.Rating) as media;
F = ORDER D BY media DESC;
STORE F INTO 'C:/output3';