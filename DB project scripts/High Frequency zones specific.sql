Select S1.part_of_day, S1.PULocationID
FROM (
	Select temp.part_of_day, Avg(temp.sum1) as mean, STDDEV(temp.sum1) as sd From
		(select part_of_day, PULocationID, Sum(tripCount) as sum1 from nyctaxi.summary Group by part_of_day, PULocationID) as temp  group by part_of_day) as ASD, (select part_of_day, PULocationID, Sum(tripCount) as sum2 from nyctaxi.summary Group by part_of_day, PULocationID) as S1
WHERE S1.part_of_day = ASD.part_of_day AND S1.sum2>4* ASD.mean
Order by S1.part_of_day, S1.sum2; 