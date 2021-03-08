
-- Join the two tables so that every column and record appears, regardless of if there is not an owner_id.
SELECT * FROM owners FULL JOIN vehicles ON owners.id = vehicles.owner_id;

--Count the number of cars for each owner. Display the owners first_name, last_name and count of vehicles. The first_name should be ordered in ascending order
SELECT first_name, last_name, COUNT(*) AS count FROM vehicles JOIN owners ON vehicles.owner
_id = owners.id GROUP BY owners.id ORDER BY count ASC;

-- Count the number of cars for each owner and display the average price for each of the cars as integers. Display the owners first_name,
-- last_name, average price and count of vehicles. The first_name should be ordered in descending order. Only display results with more than one vehicle
-- and an average price greater than 10000.Count the number of cars for each owner and display the average price for each of the cars as integers. Display
-- the owners first_name, last_name, average price and count of vehicles. 
-- The first_name should be ordered in descending order. Only display results with more than one vehicle and an average price greater than 10000.
SELECT first_name,
    last_name, 
    ROUND(AVG(price)::numeric,0) AS avg_price, 
    count(owner_id) as vehicle_count 
FROM owners
JOIN vehicles on owners.id = vehicles.owner_id 
GROUP BY owners.id 
HAVING ROUND(AVG(price)::numeric,0)>10000 AND count(owner_id)>1 ORDER BY first_name DESC;


