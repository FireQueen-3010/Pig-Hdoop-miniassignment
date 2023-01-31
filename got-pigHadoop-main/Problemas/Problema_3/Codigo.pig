A = LOAD './got_imdb.csv' USING PigStorage(',') AS (season:int, episode:int, date:chararray, title:chararray, Rating:float, count:int, descricao:chararray);
B = FOREACH A GENERATE $0, $1, $5;
C = GROUP B BY season;
D = FOREACH C GENERATE group as season, COUNT(B.episode) as episode, SUM(B.count) as count;
F = ORDER D BY count ASC;
STORE F INTO 'c:/output4';