SELECT L.Zone
from (
	SELECT PULocationID, sum(tripCount) as su 
		from nyctaxi.summaryindex
		 where DOLocationID = 4 AND part_of_day = 2 
        Group by PULocationID) as temp1, nyctaxi.taxi_zone_lookup L
        where temp1.PULocationID = L.LocationID
order by su desc LIMIT 5;