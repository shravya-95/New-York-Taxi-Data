CREATE TABLE summary as 
(Select dayofweek(lpep_pickup_new_date) as dow, PULocationID, DOLocationID, part_of_day, count(*) as tripCount, sum(passenger_count) as passCount
from nyctaxi.jan_2019 GROUP By dow, PULocationID, DOLocationID, part_of_day)
 
