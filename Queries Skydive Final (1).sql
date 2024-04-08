-- Demand/Revenue forecast

SELECT datetime, count(CustomerId), sum(cost) FROM Jumpsession natural right join goes group by month(datetime);


-- Query for report on Mechanic Performance (#4)
SELECT MechanicID,
 COUNT(v.VehicleID), SUM(Miles),
 COUNT(CarRegistrationDate),
 COUNT(AircraftRegistrationDate)
FROM vehicles v
 LEFT JOIN landvehicle lv ON v.VehicleID = lv.vehicleID
 LEFT JOIN airvehicle av ON v.VehicleID = av.vehicleID
GROUP BY MechanicID;


-–Revenue on Location
 
SELECT Location, AVG(Cost) as AverageRev, COUNT(CustomerID) as NumberOfCustomers, SUM(Cost) as TotalRevenue
FROM JumpSession natural join goes
GROUP BY Location
ORDER BY TotalRevenue DESC;

-–Customers by jump 


SELECT CustomerID, Name, DOB, SessionID FROM Customer Natural JOIN goes   
WHERE CustomerID IN(SELECT CustomerID FROM goes) AND GROUPBY sessionID, CustomerID
HAVING COUNT(SESSIONID) >= 2 ;

-–Equipment Status

SELECT EquipmentID, Type, Status, LastCheckDate
FROM Equipment where status = 'Available';

SELECT EquipmentID, Type, Status, LastCheckDate
FROM Equipment where status = 'In Repair';
