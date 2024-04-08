create DATABASE skydive
USE skydive;

CREATE TABLE Customer (
    CustomerID VARCHAR(255) PRIMARY KEY,
    Name VARCHAR(255),
    Address VARCHAR(255),
    Phone VARCHAR(20),
    DOB DATE,
    Email VARCHAR(100)
);
INSERT INTO customer (CustomerID, Name, Address, Phone, DOB, Email) VALUES
('C1', 'John Doe', '123 Maple Street', '555-1234', '1980-01-01', 'johndoe@email.com'),
('C2', 'Jane Smith', '456 Oak Avenue', '555-5678', '1990-02-02', 'janesmith@email.com'),
('C3', 'Jim Brown', '789 Pine Road', '555-9012', '1975-03-03', 'jimbrown@email.com'),
('C4', 'Jessica Jones', '321 Elm Place', '555-3456', '1985-04-04', 'jessicajones@email.com'),
('C5', 'Jack White', '654 Willow Way', '555-7890', '1995-05-05', 'jackwhite@email.com'),
('C6', 'Olivia Garcia', '987 Sunrise Lane', '555-2345', '1982-06-06', 'olivia.garcia@email.com'),
('C7', 'Michael Lee', '432 Sunset Drive', '555-6789', '1978-07-07', 'michael.lee@email.com'),
('C8', 'Sarah Brown', '1011 Hilltop Road', '555-0123', '1992-08-08', 'sarah.brown@email.com'),
('C9', 'David Miller', '567 Valley View Avenue', '555-4567', '1987-09-09', 'david.miller@email.com'),
('C10', 'Emily Jones', '234 Ocean Boulevard', '555-8901', '1997-10-10', 'emily.jones@email.com'),
('C11', 'Daniel Hernandez', '890 Mountain View Terrace', '555-3456', '1980-11-11', 'daniel.hernandez@email.com'),
('C12', 'Alexandra Williams', '567 Meadow Lane', '555-7890', '1995-12-12', 'alexandra.williams@email.com'),
('C13', 'Matthew Thompson', '1234 Lakeside Drive', '555-2345', '1977-01-01', 'matthew.thompson@email.com'),
('C14', 'Sophia Garcia', '789 Skyview Avenue', '555-6789', '1993-02-02', 'sophia.garcia@email.com'),
('C15', 'Christopher Taylor', '456 Beach Street', '555-0123', '1988-03-03', 'christopher.taylor@email.com')
;

CREATE TABLE Instructor (
    InstructorID VARCHAR(255) PRIMARY KEY,
    Name VARCHAR(255),
    DateHired DATE,
    LicenseType VARCHAR(50)
);
INSERT INTO Instructor (InstructorID, Name, DateHired, LicenseType) VALUES
('I1', 'Alice Johnson', '2015-06-22', 'Class A'),
('I2', 'Bob Smith', '2017-08-15', 'Class B'),
('I3', 'Charlie Davis', '2016-05-30', 'Class C'),
('I4', 'Diana Ross', '2018-03-12', 'Class D'),
('I5', 'Ethan Taylor', '2014-11-01', 'Class E')
;

CREATE TABLE Equipment (
    EquipmentID VARCHAR(255) PRIMARY KEY,
    Type VARCHAR(100) NOT NULL,
    Status VARCHAR(50) NOT NULL,
    PurchaseDate DATE NOT NULL,
    LastCheckDate DATE
);
INSERT INTO Equipment (EquipmentID, Type, Status, PurchaseDate, LastCheckDate) VALUES
('E1', 'Parachute', 'Available', '2019-03-01', '2023-01-10'),
('E2', 'Altimeter', 'In Repair', '2020-05-21', '2023-01-12'),
('E3', 'Goggles', 'Available', '2018-11-15', '2023-01-15'),
('E4', 'Helmet', 'In Repair', '2021-02-05', '2023-01-20'),
('E5', 'Jumpsuit', 'Available', '2022-07-19', '2023-01-25');


CREATE TABLE Mechanic (
    MechanicID VARCHAR(255) PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    DateHired DATE NOT NULL
);
INSERT INTO Mechanic (MechanicID, Name, DateHired) VALUES
('M1', 'Oliver Martinez', '2019-04-12'),
('M2', 'Sophia Wilson', '2020-02-20'),
('M3', 'Mason Lee', '2018-08-08'),
('M4', 'Emma Wong', '2021-01-15'),
('M5', 'Liam Anderson', '2017-07-30');

CREATE TABLE JumpSession (
    SessionID VARCHAR(255) PRIMARY KEY,
    JumpType VARCHAR(100),
    Cost DECIMAL(10, 2),
    Location VARCHAR(255),
    FallTime INT, -- assuming FallTime is measured in seconds or some unit of time
    Height INT
);
INSERT INTO JumpSession (SessionID, JumpType, Cost, Location, FallTime, Height) VALUES
('J1', 'Tandem', 299.99, 'Skydive Arizona', 180,15000),
('J2', 'Static Line', 199.99, 'Skydive Perris', 120,10000),
('J3', 'AFF', 349.99, 'Skydive Dubai', 60,8000),
('J4', 'Tandem', 299.99, 'Skydive Empuriabrava', 180,19000),
('J5', 'HALO', 2500.00, 'Skydive Space Center', 120,9000);

CREATE TABLE Vehicles (
    VehicleID VARCHAR(255) PRIMARY KEY,
    PurchaseDate DATE,
    PassengerCapacity INT,
    Miles INT,
    LastMaintenanceInspection DATE,
    MechanicID VARCHAR(255),
    CONSTRAINT FK_Vehicles_Mechanic FOREIGN KEY (MechanicID) REFERENCES Mechanic(MechanicID)
);

INSERT INTO Vehicles (VehicleID, PurchaseDate, PassengerCapacity, Miles, LastMaintenanceInspection, MechanicID) VALUES
  ('V1', '2020-01-15', 5, 19000, '2023-01-10', 'M2'),
  ('V2', '2021-03-20', 7, 15000, '2022-11-05', 'M1'),
  ('V3', '2022-05-10', 4, 8000, '2023-02-15', 'M3'),
  ('V4', '2020-12-01', 6, 25000, '2023-01-25', 'M2'),
  ('V5', '2022-02-28', 8, 13000, '2023-03-05', 'M1'),
  ('V6', '2021-09-08', 5, 7000, '2022-12-20', 'M3'),
  ('V7', '2022-11-15', 6, 6000, '2023-02-28', 'M3'),
  ('V8', '2020-08-22', 3, 9000, '2023-01-15', 'M4'),
  ('V9', '2021-06-05', 7, 9000, '2022-10-10', 'M3'),
  ('V10', '2023-01-02', 4, 11000, '2023-02-10', 'M4')
;

CREATE TABLE LandVehicle (
    VehicleID VARCHAR(50) PRIMARY KEY,
    CarRegistrationDate DATE,
    FOREIGN KEY (VehicleID) REFERENCES Vehicles(VehicleID)
);
INSERT INTO LandVehicle (VehicleID, CarRegistrationDate) VALUES
('V1', '2020-02-15'),
('V2', '2019-06-25'),
('V3', '2020-02-15'),
('V5', '2020-02-15'),
('V6', '2019-06-25'),
('V7', '2020-02-15'),
('V9', '2019-06-25')
;

CREATE TABLE AirVehicle (
    VehicleID VARCHAR(50) PRIMARY KEY,
    AircraftRegistrationDate DATE,
    FOREIGN KEY (VehicleID) REFERENCES Vehicles(VehicleID)
);
INSERT INTO AirVehicle (VehicleID, AircraftRegistrationDate) VALUES
('V4', '2019-06-25'),
('V8', '2021-08-30'),
('V10', '2018-12-12')
;

CREATE TABLE GoesWith (
    CustomerID VARCHAR(50),
    InstructorID VARCHAR(50),
    PRIMARY KEY (CustomerID, InstructorID),
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
    FOREIGN KEY (InstructorID) REFERENCES Instructor(InstructorID)
);
INSERT INTO GoesWith (CustomerID, InstructorID) VALUES
('C1', 'I1'), -- Assuming CustomerID 1 exists
('C2', 'I2'), -- Assuming CustomerID 2 exists
('C1', 'I2'), -- Assuming CustomerID 1 exists and can have multiple instructors
('C3', 'I3'), -- Assuming CustomerID 3 exists
('C4', 'I4'), -- Assuming CustomerID 4 exists
('C5', 'I1'), -- Assuming CustomerID 5 exists
('C2', 'I3'), -- Assuming CustomerID 2 exists and can have multiple instructors
('C3', 'I4'), -- Assuming CustomerID 3 exists and can have multiple instructors
('C4', 'I1'), -- Assuming CustomerID 4 exists and can have multiple instructors
('C5', 'I2'); -- Assuming CustomerID 5 exists and can have multiple instructors


CREATE TABLE GOES (
    CustomerID VARCHAR(255),
    InstructorID VARCHAR(255),
    SessionID VARCHAR(255),
    Datetime DATETIME,
    CONSTRAINT PK_GOES PRIMARY KEY (CustomerID, InstructorID, SessionID, Datetime),
    CONSTRAINT FK_GOES_Customer FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
    CONSTRAINT FK_GOES_Instructor FOREIGN KEY (InstructorID) REFERENCES Instructor(InstructorID),
    CONSTRAINT FK_GOES_Session FOREIGN KEY (SessionID) REFERENCES JumpSession(SessionID)
);
INSERT INTO goes (CustomerID, InstructorID, SessionID, Datetime) VALUES
('C1', 'I2', 'J3', '2023-12-06 09:00:00'),
('C1', 'I3', 'J4', '2023-12-07 10:00:00'),
('C2', 'I2', 'J3', '2023-12-08 11:00:00'),
('C3', 'I1', 'J5', '2023-12-09 12:00:00'),
('C4', 'I5', 'J1', '2023-12-10 08:00:00'),
('C5', 'I4', 'J2', '2023-12-10 09:00:00'),
('C6', 'I3', 'J3', '2023-12-10 10:00:00'),
('C7', 'I2', 'J4', '2023-12-10 11:00:00'),
('C8', 'I1', 'J5', '2023-12-10 12:00:00'),
('C9', 'I5', 'J1', '2023-12-11 08:00:00'),
('C10', 'I4', 'J2', '2023-12-11 09:00:00'),
('C11', 'I3', 'J3', '2023-12-11 10:00:00'),
('C12', 'I2', 'J4', '2023-12-11 11:00:00'),
('C13', 'I1', 'J5', '2023-12-11 12:00:00'),
('C14', 'I5', 'J1', '2023-12-12 08:00:00'),
('C15', 'I4', 'J2', '2023-12-12 09:00:00');




CREATE TABLE has (
    SessionID VARCHAR(50),
    EquipmentID VARCHAR(50),
    PRIMARY KEY (SessionID, EquipmentID),
    FOREIGN KEY (SessionID) REFERENCES JumpSession(SessionID),
    FOREIGN KEY (EquipmentID) REFERENCES Equipment(EquipmentID)
);


INSERT INTO has (SessionID, EquipmentID) VALUES
('J1', 'E1'),
('J2', 'E2'),
('J3', 'E3'),
('J4', 'E4'),
('j5', 'E1'),
('J1', 'E5'),
('J2', 'E3');


CREATE TABLE Uses (
  JumpSessionID VARCHAR(255),
  VehicleID VARCHAR(255),
  PRIMARY KEY (JumpSessionID, VehicleID),
  FOREIGN KEY (JumpSessionID) REFERENCES JumpSession(SessionID),
  FOREIGN KEY (VehicleID) REFERENCES Vehicles(VehicleID)
);


INSERT INTO Uses (JumpSessionID, VehicleID) VALUES
('J1', 'V3'), -- assuming session 1 used vehicle 3
('J2', 'V4'), -- assuming session 2 used vehicle 4
('J3', 'V1'), -- assuming session 3 used vehicle 1
('J4', 'V2'), -- assuming session 4 used vehicle 2
('J5', 'V5'); -- assuming session 5 used vehicle 5





-- Query for report on Mechanic Performance
SELECT MechanicID,
 COUNT(v.VehicleID), SUM(Miles),
 COUNT(CarRegistrationDate),
 COUNT(AircraftRegistrationDate)
FROM vehicles v
 LEFT JOIN landvehicle lv ON v.VehicleID = lv.vehicleID
 LEFT JOIN airvehicle av ON v.VehicleID = av.vehicleID
GROUP BY MechanicID;






