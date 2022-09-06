SELECT * FROM carprice_assignment;

## Altering the table name to make it easier to call in the dataset
ALTER TABLE carprice_assignment
RENAME TO cars;

SELECT * FROM cars;

## Dropping columns not needed
ALTER TABLE cars
DROP COLUMN carlength, DROP COLUMN carwidth, DROP COLUMN carheight, DROP COLUMN curbweight, DROP COLUMN stroke, DROP COLUMN compressionratio, DROP COLUMN aspiration;

ALTER TABLE cars
DROP COLUMN boreratio;

## checking for null values in the data set
SELECT * FROM cars
WHERE coalesce(car_ID, symboling, CarName, fueltype, doornumber, carbody, drivewheel, enginelocation, wheelbase, enginetype, enginesize, fuelsystem, horsepower, peakrpm, citympg, highwaympg, price) IS NULL;

### There is no null value in the data set so we move on with the data analysis

## select the 5 cars with the highest price

SELECT  CarName, price
 FROM cars
 GROUP BY price DESC LIMIT 5;
  
 
 ## which door is the most common type and do they differ in price
 ## First we check the hihest number of occuring doors in cars
 SELECT doornumber
FROM cars
GROUP BY doornumber
ORDER BY COUNT(*) DESC LIMIT 1;

## With our analysis we notice that cars with 4 doors are more common tha  2 door cars
## Next we find out how they vary with price individuality and the sum of all 2 door cars and 4 door cars
## First get the sum of all 2 door cars and 4 door cars

SELECT SUM(price)
FROM cars
WHERE doornumber = 'four';

SELECT SUM(price)
FROM cars
WHERE doornumber = 'two';

## HOW DO THEY VARY IN PRICE
SELECT CarName, doornumber, price
FROM cars
GROUP BY doornumber, price
ORDER BY MAX(price) DESC LIMIT 10;

## We can say from the analysis that the price of 2 door cars is more expensive than 4 

### Does the engine location affect the price of the car
SELECT enginelocation, sum(price)
FROM cars 
GROUP BY enginelocation;

## relationship between cars in which uses gas or deisel 
SELECT CarName, fueltype, price
FROM cars
WHERE fueltype = 'gas'
GROUP BY CarName, fueltype,  price;		

SELECT  CarName, fueltype, price
FROM cars
WHERE fueltype = 'diesel'
GROUP BY CarName, fueltype,  price ;

## Cars with gas fueltype are more common and hence the amount used is significantly greater than than of cars with diesel









