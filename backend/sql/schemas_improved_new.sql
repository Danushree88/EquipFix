create database EquipmentMaintenanceNew;
use EquipmentMaintenanceNew;

CREATE TABLE Equipment (
    EquipmentID INT PRIMARY KEY,
    Name VARCHAR(100),
    Description TEXT,
    Location VARCHAR(100),
    PurchaseCost DECIMAL(10,2),
    PurchaseDate DATE,
    BreakdownCost DECIMAL(10,2),
    ShutdownHours INT,
    Lifetime INT,
    Speciality VARCHAR(100),
    Specialization VARCHAR(100)
);

CREATE TABLE Component (
    ComponentID INT PRIMARY KEY,
    Name VARCHAR(100),
    PurchaseDate DATE,
    Lifetime INT,
    InventoryLevel INT,
    UnitCost DECIMAL(10,2),
    SupplierName VARCHAR(100),
    ContactPerson VARCHAR(100),
    ContactTelephone VARCHAR(20),
    EquipmentID INT,
    FOREIGN KEY (EquipmentID) REFERENCES Equipment(EquipmentID)
);

CREATE TABLE Employee (
    SSN INT PRIMARY KEY,
    Name VARCHAR(100),
    Address TEXT,
    Department VARCHAR(50),
    Specialty VARCHAR(50),
    EmploymentDate DATE
);

select * from employee;

ALTER TABLE Employee 
ADD COLUMN Status ENUM('Assigned', 'Unassigned') DEFAULT 'Unassigned';

CREATE TABLE Maintenance (
    MaintenanceID INT PRIMARY KEY,
    Name VARCHAR(100),
    Type ENUM('Shutdown', 'Breakdown'),
    Description TEXT,
    TotalHours INT,
    EquipmentID INT,
    FOREIGN KEY (EquipmentID) REFERENCES Equipment(EquipmentID)
);

ALTER TABLE Maintenance
ADD COLUMN Status ENUM('Pending', 'In Progress', 'Completed', 'Cancelled') DEFAULT 'Pending';

select * from maintenance;



CREATE TABLE MaintenanceRecord (
    SSN INT PRIMARY KEY,
    MaintenanceID INT,
    HoursWorked INT,
	EmployeeID INT
);

CREATE TABLE ComponentReplacement (
    ReplacementID INT PRIMARY KEY,
    ComponentID INT,
    EquipmentID INT,
    ReplacementDate DATE,
    ManHoursUsed INT,
    QuantityUsed INT

);
select * from MaintenanceCompany;
drop table maintenancecompany;

CREATE TABLE MaintenanceCompany (
    CompanyID INT PRIMARY KEY,
    Name VARCHAR(100),
    Address TEXT,
    ContactPerson VARCHAR(100),
    ContactTelephone VARCHAR(20),
    ServicesProvided TEXT
);

CREATE TABLE OutsourcedTo (
	SSN INT PRIMARY KEY,
    MaintenanceID INT,
    HoursWorked INT,
    CompanyID INT
);

-- Modify tables to add AUTO_INCREMENT to SSN
ALTER TABLE MaintenanceRecord MODIFY SSN INT AUTO_INCREMENT;
ALTER TABLE OutsourcedTo MODIFY SSN INT AUTO_INCREMENT;

-- Insert records ensuring proper assignment
INSERT INTO MaintenanceRecord (MaintenanceID, HoursWorked, EmployeeID) VALUES
(1, 10, 1001), (2, 8, 1002),  (4, 7, 1004), (6, 6, 1006),(8, 10, 1008),
 (10, 8, 1010),
(11, 13, 1011), (12, 9, 1012), (13, 14, 1013), (14, 7, 1014), (15, 10, 1015),
(16, 6, 1016),  (18, 5, 1018), (20, 6, 1020),
(22, 9, 1002), (24, 14, 1004), 
(26, 8, 1006), (28, 11, 1008),  (30, 13, 1010),
(31, 7, 1011), (32, 9, 1012), (33, 8, 1013), (34, 10, 1014), (35, 12, 1015),
(36, 5, 1016), (37, 11, 1017), (38, 6, 1018), (39, 9, 1019), (40, 7, 1020);

-- Insert records for outsourced maintenance that employees cannot handle
INSERT INTO OutsourcedTo (MaintenanceID, HoursWorked, CompanyID) VALUES
 (3, 12, 7), (5, 15, 9), (7, 9, 11), (9, 11, 13),
 (17, 11, 21), (19, 8, 23),
(21, 12, 25), (23, 7, 27), (25, 10, 29), (27, 12, 31), (29, 9, 33);

drop table maintenancerecord;

drop table outsourcedto;

select * from employee;
INSERT INTO Equipment (EquipmentID, Name, Description, Location, PurchaseCost, PurchaseDate, BreakdownCost, ShutdownHours, Lifetime, Speciality, Specialization) VALUES
(1, 'Excavator', 'Heavy construction equipment for digging and earthmoving.', 'Site A', 150000.00, '2020-01-15', 5000.00, 10, 15, 'Earthmoving', 'Mechanical Maintenance'),
(2, 'Bulldozer', 'Powerful tractor with a blade for pushing large quantities of soil.', 'Site B', 120000.00, '2019-03-22', 4000.00, 8, 20, 'Earthmoving', 'Hydraulics & Maintenance'),
(3, 'Crane', 'Machine for lifting and moving heavy materials.', 'Site C', 250000.00, '2021-06-10', 8000.00, 12, 25, 'Lifting', 'Mechanical Maintenance'),
(4, 'Forklift', 'Industrial vehicle for lifting and transporting materials.', 'Warehouse 1', 30000.00, '2022-02-05', 2000.00, 5, 10, 'Material Handling', 'Logistics & Operations'),
(5, 'Concrete Mixer', 'Machine for mixing concrete.', 'Site D', 45000.00, '2020-11-30', 1500.00, 4, 12, 'Concrete Work', 'Mechanical Maintenance'),
(6, 'Generator', 'Portable power generator for construction sites.', 'Site E', 20000.00, '2021-08-15', 1000.00, 3, 8, 'Power Supply', 'Electrical Systems'),
(7, 'Dump Truck', 'Truck for transporting loose material.', 'Site F', 80000.00, '2019-05-20', 3000.00, 6, 15, 'Transportation', 'Logistics & Operations'),
(8, 'Paver', 'Machine for laying asphalt on roads.', 'Site G', 120000.00, '2020-04-10', 4000.00, 7, 18, 'Road Construction', 'Mechanical Maintenance'),
(9, 'Backhoe Loader', 'Versatile machine for digging and loading.', 'Site H', 90000.00, '2021-01-25', 2500.00, 5, 15, 'Earthmoving', 'Hydraulics & Maintenance'),
(10, 'Scissor Lift', 'Elevated platform for working at heights.', 'Site I', 35000.00, '2022-03-12', 1200.00, 2, 10, 'Lifting', 'Safety & Quality Assurance'),
(11, 'Compactor', 'Machine for compacting soil and asphalt.', 'Site J', 25000.00, '2020-09-18', 800.00, 3, 10, 'Road Construction', 'Mechanical Maintenance'),
(12, 'Telehandler', 'Versatile lifting machine for construction sites.', 'Site K', 70000.00, '2021-07-30', 3000.00, 4, 15, 'Material Handling', 'Logistics & Operations'),
(13, 'Asphalt Roller', 'Machine for compacting asphalt.', 'Site L', 60000.00, '2019-12-05', 2000.00, 5, 12, 'Road Construction', 'Safety & Quality Assurance'),
(14, 'Water Truck', 'Truck for transporting water to construction sites.', 'Site M', 50000.00, '2020-10-20', 1500.00, 3, 10, 'Transportation', 'Logistics & Operations'),
(15, 'Chipper', 'Machine for shredding wood and brush.', 'Site N', 15000.00, '2021-05-15', 500.00, 2, 8, 'Material Processing', 'Fabrication & Welding'),
(16, 'Pressure Washer', 'Machine for cleaning surfaces with high-pressure water.', 'Warehouse 2', 3000.00, '2022-01-10', 200.00, 1, 5, 'Cleaning', 'Safety & Quality Assurance'),
(17, 'Ladder', 'Portable ladder for reaching heights.', 'Warehouse 3', 500.00, '2021-09-01', 50.00, 0, 10, 'Lifting', 'Safety & Quality Assurance'),
(18, 'Sander', 'Machine for smoothing surfaces.', 'Workshop', 2000.00, '2020-06-15', 100.00, 1, 7, 'Material Processing', 'Fabrication & Welding'),
(19, 'Welding Machine', 'Machine for welding metal parts.', 'Workshop', 4000.00, '2019-11-25', 300.00, 2, 10, 'Metal Work', 'Fabrication & Welding'),
(20, 'Forklift Truck', 'Heavy-duty forklift for warehouse operations.', 'Warehouse 4', 60000.00, '2021-04-20', 2500.00, 3, 12, 'Material Handling', 'Logistics & Operations');

INSERT INTO Component (ComponentID, Name, PurchaseDate, Lifetime, InventoryLevel, UnitCost, SupplierName, ContactPerson, ContactTelephone, EquipmentID) VALUES
(1, 'Hydraulic Pump', '2020-01-10', 5, 10, 1500.00, 'Hydraulic Solutions Inc.', 'Alice Johnson', '555-0101', 1),  -- Excavator
(2, 'Engine', '2020-02-15', 10, 5, 25000.00, 'Heavy Machinery Co.', 'Bob Smith', '555-0102', 1),  -- Excavator
(3, 'Track Shoes', '2020-03-20', 3, 20, 300.00, 'Tracks & More', 'Charlie Brown', '555-0103', 2),  -- Bulldozer
(4, 'Blade', '2020-04-25', 4, 15, 1200.00, 'Construction Blades Ltd.', 'David Wilson', '555-0104', 2),  -- Bulldozer
(5, 'Boom Arm', '2021-05-30', 6, 8, 8000.00, 'Crane Parts Corp.', 'Eva Green', '555-0105', 3),  -- Crane
(6, 'Forklift Battery', '2021-06-12', 3, 12, 2000.00, 'Power Batteries Inc.', 'Frank White', '555-0106', 4),  -- Forklift
(7, 'Concrete Drum', '2021-07-18', 5, 10, 500.00, 'Mixers & Components Co.', 'Grace Black', '555-0107', 5),  -- Concrete Mixer
(8, 'Generator Starter', '2021-08-22', 4, 15, 150.00, 'Generator Parts Co.', 'Henry Blue', '555-0108', 6),  -- Generator
(9, 'Dump Bed', '2021-09-30', 8, 7, 3000.00, 'Truck Components Ltd.', 'Ivy Red', '555-0109', 7),  -- Dump Truck
(10, 'Paver Screed', '2021-10-15', 6, 5, 6000.00, 'Road Equipment Inc.', 'Jack Gray', '555-0110', 8),  -- Asphalt Paver
(11, 'Loader Bucket', '2022-01-05', 7, 10, 3500.00, 'Bucket Supplies Co.', 'Karen Gold', '555-0111', 9),  -- Wheel Loader
(12, 'Lift Cylinder', '2022-02-20', 5, 12, 1200.00, 'Lift Parts Co.', 'Leo Silver', '555-0112', 10),  -- Hydraulic Lift
(13, 'Compactor Plate', '2022-03-15', 4, 20, 400.00, 'Compaction Experts Inc.', 'Mia Greenfield', '555-0113', 11),  -- Compactor
(14, 'Telehandler Forks', '2022-04-18', 6, 6, 2500.00, 'Forks & More Ltd.', 'Nina Bluebell', '555-0114', 12),  -- Telehandler
(15, 'Asphalt Roller Drum', '2022-05-25', 5, 8, 2000.00, 'Roller Parts & Supply', 'Oscar Blackwood', '555-0115', 13),  -- Road Roller
(16, 'Water Tank', '2022-06-30', 3, 10, 1500.00, 'Water Solutions Inc.', 'Paula White', '555-0116', 14),  -- Water Truck
(17, 'Chipper Blades', '2022-07-15', 4, 20, 250.00, 'Woodworking Supplies Co.', 'Quinn Brown', '555-0117', 15),  -- Wood Chipper
(18, 'Pressure Washer Hose', '2022-08-20', 3, 25, 100.00, 'Cleaning Equipment Ltd.', 'Rita Blue', '555-0118', 16),  -- Pressure Washer
(19, 'Ladder Rungs', '2022-09-25', 5, 50, 20.00, 'Ladder Parts Co.', 'Sam Green', '555-0119', 17),  -- Ladder
(20, 'Sander Pads', '2022-10-30', 4, 30, 15.00, 'Sanding Supplies Inc.', 'Tina Goldsmith', '555-0120', 18),  -- Floor Sander
(21, 'Welding Rods', '2022-11-05', 3, 40, 50.00, 'Welding Supplies Co.', 'Ursula Silverstone', '555-0121', 19),  -- Welding Machine
(22, 'Forklift Tires', '2022-12-10', 5, 15, 800.00, 'Tire Solutions Ltd.', 'Victor Blackwood', '555-0122', 20),  -- Forklift
(23, 'Hydraulic Hose Assembly', '2023-01-15', 4, 18, 300.00, 'Hose & Fittings Co.', 'Wendy Rose', '555-0123', 1),  -- Excavator
(24, 'Safety Guard Kit', '2023-02-20', 3, 25, 200.00, 'Safety First Inc.', 'Xander Gray', '555-0124', 13),  -- Road Roller
(25, 'Control Panel Assembly', '2023-03-05', 5, 12, 1200.00, 'Control Systems Ltd.', 'Yvonne White', '555-0125', 10),  -- Hydraulic Lift
(26, 'Excavator Hydraulic Filter', '2023-04-10', 3, 15, 180.00, 'Filter Experts Inc.', 'Zane Black', '555-0126', 1),  -- Excavator
(27, 'Bulldozer Final Drive', '2023-05-12', 7, 5, 5000.00, 'Drive Train Co.', 'Amy White', '555-0127', 2),  -- Bulldozer
(28, 'Concrete Mixer Motor', '2023-06-20', 6, 10, 3500.00, 'Industrial Motors Ltd.', 'Ben Grey', '555-0128', 5),  -- Concrete Mixer
(29, 'Road Roller Vibration Pump', '2023-07-18', 4, 8, 2500.00, 'Vibration Tech Inc.', 'Chloe Blue', '555-0129', 13),  -- Road Roller
(30, 'Loader Transmission', '2023-08-22', 6, 6, 7000.00, 'Transmissions & Parts Co.', 'Daniel Red', '555-0130', 9);  -- Wheel Loader


select * from componentreplacement;

INSERT INTO Employee (SSN, Name, Address, Department, Specialty, EmploymentDate) VALUES
(1001, 'Alice Johnson', '123 Main St, Cityville', 'Maintenance', 'Mechanical Maintenance', '2020-01-15'),
(1002, 'Bob Smith', '456 Elm St, Townsville', 'Maintenance', 'Electrical Systems', '2019-03-22'),
(1003, 'Charlie Brown', '789 Oak St, Villageburg', 'Operations', 'Mechanical Maintenance', '2021-06-10'),
(1004, 'David Wilson', '321 Pine St, Hamletton', 'Maintenance', 'Fabrication & Welding', '2022-02-05'),
(1005, 'Eva Green', '654 Maple St, Metropolis', 'Maintenance', 'Hydraulics & Maintenance', '2020-11-30'),
(1006, 'Frank White', '987 Cedar St, Capital City', 'Operations', 'Logistics & Operations', '2021-08-15'),
(1007, 'Grace Black', '135 Willow St, Suburbia', 'Maintenance', 'Safety & Quality Assurance', '2019-05-20'),
(1008, 'Henry Blue', '246 Birch St, Countryside', 'Operations', 'Safety & Quality Assurance', '2020-04-10'),
(1009, 'Ivy Red', '357 Spruce St, Lakeside', 'Maintenance', 'Fabrication & Welding', '2021-01-25'),
(1010, 'Jack Gray', '468 Fir St, Hilltop Town', 'Maintenance', 'Hydraulics & Maintenance', '2022-03-12'),
(1011, 'Karen Gold', '579 Chestnut St, Riverside', 'Operations', 'Logistics & Operations', '2020-09-18'),
(1012, 'Leo Silver', '680 Ash St, Valley View', 'Maintenance', 'Electrical Systems', '2021-07-30'),
(1013, 'Mia Greenfield', '791 Palm St, Oceanview City', 'Maintenance', 'Mechanical Maintenance', '2019-12-05'),
(1014, 'Nina Bluebell', '802 Cypress St, Mountainview', 'Operations', 'Logistics & Operations', '2020-10-20'),
(1015, 'Oscar Blackwood', '913 Redwood St, Forest City', 'Maintenance', 'Fabrication & Welding', '2021-05-15'),
(1016, 'Paula White', '024 Magnolia St, Baytown', 'Operations', 'Hydraulics & Maintenance', '2022-01-10'),
(1017, 'Quinn Brown', '135 Dogwood St, Greenfield', 'Maintenance', 'Fabrication & Welding', '2021-09-01'),
(1018, 'Rita Blue', '246 Larch St, Sunnyvale', 'Operations', 'Hydraulics & Maintenance', '2020-06-15'),
(1019, 'Sam Green', '357 Hemlock St, Riverbend', 'Maintenance', 'Safety & Quality Assurance', '2019-11-25'),
(1020, 'Tina Goldsmith', '468 Juniper St, Hillcrest', 'Operations', 'Fabrication & Welding', '2021-04-20'),
(1021, 'Ursula Silverstone', '579 Fir Ave., Lakewood', 'Maintenance', 'Electrical Systems', '2022-02-28'),
(1022, 'Victor Blackwood', '680 Elm Ave., Brookfield', 'Operations', 'Mechanical Maintenance', '2019-08-15'),
(1023, 'Wendy Rose', '791 Maple Ave., Rivertown', 'Maintenance', 'Hydraulics & Maintenance', '2023-01-10'),
(1024, 'Xander Gray', '802 Oak Ave., Woodland', 'Operations', 'Logistics & Operations', '2023-02-12'),
(1025, 'Yvonne White', '913 Cedar Ave., Hillview', 'Maintenance', 'Hydraulics & Maintenance', '2023-03-05'),
(1026, 'Zachary Knight', '024 Pine Ave., Crestwood', 'Operations', 'Logistics & Operations', '2022-11-01'),
(1027, 'Angela Carter', '135 Cherry Ave., Seaside', 'Maintenance', 'Safety & Quality Assurance', '2022-07-14'),
(1028, 'Brian Lee', '246 Walnut Ave., Eastside', 'Operations', 'Logistics & Operations', '2021-09-22'),
(1029, 'Catherine Scott', '357 Hickory Ave., Westfield', 'Maintenance', 'Mechanical Maintenance', '2020-03-18'),
(1030, 'Daniel Young', '468 Birch Ave., Southtown', 'Operations', 'Safety & Quality Assurance', '2019-10-30');

drop table equipment;
select * from outsourcedto;

INSERT INTO Maintenance (MaintenanceID, Name, Type, Description, TotalHours, EquipmentID) VALUES
(1, 'Engine Overhaul', 'Shutdown', 'Complete engine rebuild for improved efficiency.', 50, 1),
(2, 'Hydraulic System Repair', 'Breakdown', 'Fixed hydraulic pump leakage.', 12, 1),
(3, 'Blade Replacement', 'Shutdown', 'Replaced worn-out blade for bulldozer.', 20, 2),
(4, 'Track Alignment', 'Breakdown', 'Corrected misalignment of track shoes.', 15, 2),
(5, 'Boom Arm Reinforcement', 'Shutdown', 'Structural reinforcement of crane boom arm.', 30, 3),
(6, 'Forklift Battery Replacement', 'Breakdown', 'Replaced dead battery for forklift.', 8, 4),
(7, 'Concrete Drum Maintenance', 'Shutdown', 'Lubricated and cleaned drum components.', 10, 5),
(8, 'Generator Overhaul', 'Breakdown', 'Complete servicing of generator motor.', 18, 6),
(9, 'Dump Truck Suspension Repair', 'Shutdown', 'Fixed worn-out shock absorbers.', 25, 7),
(10, 'Paver Screed Calibration', 'Breakdown', 'Adjusted screed for uniform asphalt laying.', 12, 8),
(11, 'Loader Bucket Welding', 'Shutdown', 'Reinforced worn edges of loader bucket.', 22, 9),
(12, 'Lift Cylinder Servicing', 'Breakdown', 'Lubricated and cleaned lift cylinder.', 14, 10),
(13, 'Compactor Plate Replacement', 'Shutdown', 'Replaced broken plate for better compaction.', 20, 11),
(14, 'Telehandler Hydraulic Repair', 'Breakdown', 'Fixed minor hydraulic leaks.', 9, 12),
(15, 'Asphalt Roller Drum Resurfacing', 'Shutdown', 'Resurfaced roller drum for smooth compaction.', 16, 13),
(16, 'Water Pump Repair', 'Breakdown', 'Replaced damaged water pump.', 10, 14),
(17, 'Wood Chipper Blade Sharpening', 'Shutdown', 'Sharpened and aligned chipper blades.', 12, 15),
(18, 'Pressure Washer Hose Fix', 'Breakdown', 'Repaired leak in pressure washer hose.', 7, 16),
(19, 'Ladder Safety Inspection', 'Shutdown', 'Routine safety check for structural integrity.', 5, 17),
(20, 'Welding Machine Circuit Repair', 'Breakdown', 'Fixed faulty wiring inside welding machine.', 8, 19);


INSERT INTO MaintenanceCompany (CompanyID, Name, Address, ContactPerson, ContactTelephone, ServicesProvided) VALUES
(1, 'Heavy Equipment Repairs Inc.', '123 Industrial Park, Cityville', 'Michael Brown', '555-1001', 'Engine Overhaul, Welding, Structural Repairs, Mechanical Maintenance'),
(2, 'Precision Hydraulics Ltd.', '456 Mechanics Lane, Townsville', 'Sarah Green', '555-1002', 'Hydraulic System Repairs, Pump Replacement, Hydraulics & Maintenance'),
(3, 'Blade Works Co.', '789 Metal St, Villageburg', 'Tom Wilson', '555-1003', 'Blade Manufacturing, Sharpening, Replacements, Mechanical Maintenance'),
(4, 'Track Alignment Experts', '321 Rail St, Hamletton', 'Emma Johnson', '555-1004', 'Track Alignment, Undercarriage Repair, Mechanical Maintenance'),
(5, 'Cranes & More Ltd.', '654 Tower St, Metropolis', 'Jacob White', '555-1005', 'Boom Arm Maintenance, Structural Reinforcement, Lifting, Mechanical Maintenance'),
(6, 'Battery Power Solutions', '987 Energy St, Capital City', 'Olivia Carter', '555-1006', 'Battery Replacements, Power Storage Solutions, Electrical Systems'),
(7, 'Concrete Solutions Inc.', '135 Cement Rd, Suburbia', 'Lucas Gray', '555-1007', 'Concrete Drum Repair, Mixing Optimization, Mechanical Maintenance'),
(8, 'Generator Experts Co.', '246 Powerhouse Ave, Countryside', 'Sophia Black', '555-1008', 'Generator Repair, Overhaul, Fuel Efficiency, Electrical Systems'),
(9, 'Truck Care Ltd.', '357 Haulage St, Lakeside', 'Ethan Brooks', '555-1009', 'Truck Suspension, Brake Maintenance, Logistics & Operations'),
(10, 'Road Paving Equipment', '468 Asphalt Ave, Hilltop Town', 'Madison Green', '555-1010', 'Paver Maintenance, Screed Calibration, Mechanical Maintenance'),
(11, 'Metal Welding Solutions', '579 Alloy St, Riverside', 'Noah Parker', '555-1011', 'Welding Services, Fabrication, Mechanical Maintenance'),
(12, 'Lift Cylinder Professionals', '680 Hydraulic St, Valley View', 'Mia Adams', '555-1012', 'Cylinder Servicing, Seal Replacement, Hydraulics & Maintenance'),
(13, 'Compactor Specialists', '791 Density Rd, Oceanview', 'Liam Hill', '555-1013', 'Compactor Plate Repair, Alignment, Mechanical Maintenance'),
(14, 'Construction Hydraulics Ltd.', '802 Fluid St, Mountainview', 'Ella Mitchell', '555-1014', 'Hydraulic Leak Repair, Oil Change, Hydraulics & Maintenance'),
(15, 'Asphalt Equipment Works', '913 Rolling St, Forest City', 'Benjamin Moore', '555-1015', 'Roller Drum Resurfacing, Alignment, Mechanical Maintenance'),
(16, 'Water Systems Ltd.', '024 Aqua St, Baytown', 'Amelia Cooper', '555-1016', 'Pump Repair, Water Transport Equipment, Hydraulics & Maintenance'),
(17, 'Wood Machinery Experts', '135 Timber Rd, Greenfield', 'William Garcia', '555-1017', 'Wood Chipping, Blade Sharpening, Mechanical Maintenance'),
(18, 'Cleaning Equipment Services', '246 Pressure St, Sunnyvale', 'Charlotte Thompson', '555-1018', 'Pressure Washer Repair, Hose Replacement, Safety & Quality Assurance'),
(19, 'Ladder & Safety Solutions', '357 Climb St, Riverbend', 'Daniel Martinez', '555-1019', 'Ladder Inspections, Safety Gear Supply, Safety & Quality Assurance'),
(20, 'Welding Machines Ltd.', '468 Metalwork Ave, Hillcrest', 'Isabella Robinson', '555-1020', 'Welding Machine Repair, Circuit Fixes, Electrical Systems');

INSERT INTO Maintenance (MaintenanceID, Name, Type, Description, TotalHours, EquipmentID) VALUES
(21, 'Engine Overhaul', 'Breakdown', 'Complete engine overhaul of the excavator.', 12, 1),
(22, 'Hydraulic Pump Replacement', 'Shutdown', 'Replacing hydraulic pump in the bulldozer.', 8, 2),
(23, 'Brake System Repair', 'Breakdown', 'Fixing brake issues in the dump truck.', 5, 7),
(24, 'Electrical System Check', 'Shutdown', 'Routine electrical maintenance for forklift.', 3, 4),
(25, 'Track Tension Adjustment', 'Shutdown', 'Adjusting track tension for the excavator.', 4, 1),
(26, 'Fuel Injector Cleaning', 'Shutdown', 'Cleaning fuel injectors to improve efficiency.', 3, 6),
(27, 'Cooling System Repair', 'Breakdown', 'Fixing overheating issues in the paver.', 6, 8),
(28, 'Suspension Overhaul', 'Shutdown', 'Overhauling suspension system in the dump truck.', 10, 7),
(29, 'Transmission Fluid Change', 'Shutdown', 'Changing transmission fluid in the roller.', 4, 13),
(30, 'Engine Cooling Fan Repair', 'Breakdown', 'Fixing the cooling fan in the concrete mixer.', 5, 5),
(31, 'Hydraulic Cylinder Replacement', 'Shutdown', 'Replacing hydraulic cylinder in the scissor lift.', 6, 10),
(32, 'Generator Alternator Check', 'Shutdown', 'Routine alternator maintenance.', 3, 6),
(33, 'Welding Frame Repair', 'Breakdown', 'Welding and reinforcing frame damage.', 7, 9),
(34, 'Control Panel Software Update', 'Shutdown', 'Updating software in the control panel.', 2, 10),
(35, 'Bucket Teeth Replacement', 'Shutdown', 'Replacing worn-out bucket teeth on the backhoe loader.', 5, 9),
(36, 'Emergency Brake Inspection', 'Shutdown', 'Inspecting emergency brakes on forklifts.', 3, 4),
(37, 'Hydraulic Filter Replacement', 'Shutdown', 'Changing hydraulic filters to maintain efficiency.', 4, 12),
(38, 'Exhaust System Repair', 'Breakdown', 'Fixing leaks in the exhaust system.', 5, 14),
(39, 'Concrete Drum Lubrication', 'Shutdown', 'Lubricating drum bearings for smooth operation.', 3, 5),
(40, 'Electrical Wiring Inspection', 'Shutdown', 'Inspecting wiring for safety compliance.', 4, 16);

select * from maintenance;

INSERT INTO MaintenanceCompany (CompanyID, Name, Address, ContactPerson, ContactTelephone, ServicesProvided) VALUES
(21, 'Precision Engine Works', '100 Motor St, Engine Town', 'John Smith', '555-0121', 'Engine overhauls and repairs'),
(22, 'Hydraulic Solutions Inc.', '105 Pump Rd, Hydraulic City', 'Alice Johnson', '555-0122', 'Hydraulic system maintenance'),
(23, 'Brake Specialists Ltd.', '110 Brake Ave, Safetyville', 'Michael Brown', '555-0123', 'Brake system diagnostics and repairs'),
(24, 'PowerTech Electrical', '115 Voltage Rd, Electropolis', 'Emily White', '555-0124', 'Electrical system diagnostics and maintenance'),
(25, 'Heavy Tracks Maintenance', '120 Trackway Blvd, Tracktown', 'Daniel Lee', '555-0125', 'Track tensioning and undercarriage services'),
(26, 'Fuel Systems Experts', '125 Injector St, Fuelburg', 'Olivia Green', '555-0126', 'Fuel injector cleaning and maintenance'),
(27, 'Cooling Solutions Co.', '130 Radiator Rd, Cool City', 'Jacob Wright', '555-0127', 'Cooling system diagnostics and repairs'),
(28, 'Truck Suspension Masters', '135 Shock Absorber Blvd, Trucksville', 'Sophia Adams', '555-0128', 'Truck suspension servicing'),
(29, 'Transmission Care Ltd.', '140 Gearbox St, Shiftville', 'Benjamin Hall', '555-0129', 'Transmission maintenance and fluid replacement'),
(30, 'Concrete Mixer Pros', '145 Drum Ave, Mixer Town', 'Ella Scott', '555-0130', 'Concrete mixer repairs and servicing'),
(31, 'Hydraulic Cylinder Experts', '150 Ram Rd, Hydrotown', 'William Parker', '555-0131', 'Hydraulic cylinder repairs and replacements'),
(32, 'Generator Maintenance Ltd.', '155 Power Dr, ElectriCity', 'Charlotte Martinez', '555-0132', 'Generator servicing and alternator checks'),
(33, 'Metal Welding Solutions', '160 Arc St, Weld City', 'Liam Nelson', '555-0133', 'Structural welding and frame repairs'),
(34, 'Control Panel Systems', '165 Circuit Rd, TechCity', 'Ava Rodriguez', '555-0134', 'Control panel software updates and repairs'),
(35, 'Bucket Repair Services', '170 Digging St, Bucketville', 'Ethan Cooper', '555-0135', 'Bucket repairs and teeth replacement'),
(36, 'Safety Brakes Inc.', '175 Emergency St, Safe Haven', 'Mia Campbell', '555-0136', 'Emergency brake inspections and servicing'),
(37, 'Hydraulic Filtration Pros', '180 CleanOil Rd, Filtration City', 'James Wilson', '555-0137', 'Hydraulic filter replacements'),
(38, 'Exhaust Repair Experts', '185 Emission St, Smoke City', 'Harper Lewis', '555-0138', 'Exhaust system diagnostics and repairs'),
(39, 'Concrete Drum Care Ltd.', '190 Spin Ave, Cementville', 'Elijah Turner', '555-0139', 'Concrete drum lubrication and maintenance'),
(40, 'Electrical Safety Inspections', '195 Voltage Rd, Spark City', 'Isabella Baker', '555-0140', 'Electrical wiring inspections and compliance');

select * from maintenanceCompany;


INSERT INTO ComponentReplacement (ReplacementID, ComponentID, EquipmentID, ReplacementDate, ManHoursUsed, QuantityUsed) VALUES
(1, 1, 1, '2023-01-10', 3, 1),
(2, 2, 1, '2023-02-15', 4, 1),
(3, 3, 2, '2023-03-20', 2, 4),
(4, 4, 2, '2023-04-25', 5, 2),
(5, 5, 3, '2023-05-30', 6, 1),
(6, 6, 4, '2023-06-12', 3, 1),
(7, 7, 5, '2023-07-18', 2, 3),
(8, 8, 6, '2023-08-22', 1, 2),
(9, 9, 7, '2023-09-30', 5, 1),
(10, 10, 8, '2023-10-15', 6, 1),
(11, 11, 9, '2023-11-05', 3, 2),
(12, 12, 10, '2023-12-20', 4, 1),
(13, 13, 11, '2024-01-10', 2, 3),
(14, 14, 12, '2024-02-15', 5, 1),
(15, 15, 13, '2024-03-30', 6, 2),
(16, 16, 14, '2024-04-25', 3, 1),
(17, 17, 15, '2024-05-15', 2, 4),
(18, 18, 16, '2024-06-10', 1, 2),
(19, 19, 17, '2024-07-05', 5, 1),
(20, 20, 18, '2024-08-20', 6, 1),
(21, 21, 19, '2024-09-10', 3, 2),
(22, 22, 20, '2024-10-05', 4, 1),
(23, 23, 1, '2024-11-18', 2, 3),
(24, 24, 2, '2024-12-25', 5, 1),
(25, 25, 3, '2025-01-10', 6, 2),
(26, 1, 4, '2025-02-15', 3, 1),
(27, 2, 5, '2025-03-20', 2, 4),
(28, 3, 6, '2025-04-25', 1, 2),
(29, 4, 7, '2025-05-30', 5, 1),
(30, 5, 8, '2025-06-12', 6, 1),
(31, 6, 9, '2025-07-18', 3, 2),
(32, 7, 10, '2025-08-22', 4, 1),
(33, 8, 11, '2025-09-30', 2, 3),
(34, 9, 12, '2025-10-15', 5, 1),
(35, 10, 13, '2025-11-05', 6, 2),
(36, 11, 14, '2025-12-20', 3, 1),
(37, 12, 15, '2026-01-10', 2, 4),
(38, 13, 16, '2026-02-15', 1, 2),
(39, 14, 17, '2026-03-30', 5, 1),
(40, 15, 18, '2026-04-25', 6, 1),
(41, 16, 19, '2026-05-15', 3, 2),
(42, 17, 20, '2026-06-10', 4, 1),
(43, 18, 1, '2026-07-05', 2, 3),
(44, 19, 2, '2026-08-20', 5, 1),
(45, 20, 3, '2026-09-10', 6, 2),
(46, 21, 4, '2026-10-05', 3, 1),
(47, 22, 5, '2026-11-18', 2, 4),
(48, 23, 6, '2026-12-25', 1, 2),
(49, 24, 7, '2027-01-10', 5, 1),
(50, 25, 8, '2027-02-15', 6, 1);

select * from maintenanceRECORD;

DELIMITER $$

DROP PROCEDURE IF EXISTS GetOverview$$

CREATE PROCEDURE GetOverview()
BEGIN
    -- Equipment count
    SELECT COUNT(*) AS total_equipment FROM Equipment;

    -- Active maintenance tasks count
    SELECT COUNT(*) AS active_maintenance_tasks FROM Maintenance;

    -- Employee count
    SELECT COUNT(*) AS total_employees FROM Employee;

    -- Breakdown maintenance count
    SELECT COUNT(*) AS total_breakdown FROM Maintenance WHERE Type='Breakdown';

    -- Shutdown maintenance count
    SELECT COUNT(*) AS total_shutdown FROM Maintenance WHERE Type='Shutdown';

    -- Monthly maintenance cost
    SELECT COALESCE(SUM(BreakdownCost), 0.0) AS monthly_maintenance_cost FROM Equipment;

    -- High maintenance equipment
    SELECT Name, COALESCE(BreakdownCost, 0.0) AS BreakdownCost 
    FROM Equipment 
    ORDER BY BreakdownCost DESC 
    LIMIT 1;
END $$

DELIMITER ;

DELIMITER //

CREATE TRIGGER assign_initial_maintenance
AFTER INSERT ON Equipment
FOR EACH ROW
BEGIN
    DECLARE maintenance_type VARCHAR(10);
    DECLARE new_maintenance_id INT;

    -- Check if the equipment is defective
    IF NEW.BreakdownCost > 5000 OR NEW.ShutdownHours > 100 THEN
        -- Determine Maintenance Type
        IF NEW.BreakdownCost > 5000 THEN
            SET maintenance_type = 'Breakdown';
        ELSE
            SET maintenance_type = 'Shutdown';
        END IF;

        -- Get the next MaintenanceID safely
        SELECT COALESCE(MAX(MaintenanceID), 0) + 1 INTO new_maintenance_id FROM Maintenance;

        -- Insert initial maintenance task
        INSERT INTO Maintenance (MaintenanceID, Name, Type, Description, TotalHours, EquipmentID, Status)
        VALUES (
            new_maintenance_id, 
            CONCAT('Initial Maintenance for ', NEW.Name), 
            maintenance_type, 
            'Automatically assigned first maintenance task for defective equipment.',
            10, -- Default hours
            NEW.EquipmentID,
            'Pending'
        );
    END IF; -- Only assigns maintenance if defective
END;
//
DELIMITER ;
DROP TRIGGER assign_initial_maintenance;
SHOW TRIGGERS FROM EquipmentMaintenanceNew;

select * from maintenance;

DELIMITER //

CREATE PROCEDURE AssignMaintenanceTask(IN p_MaintenanceID INT)
BEGIN
    DECLARE v_EquipmentID INT;
    DECLARE v_Specialization VARCHAR(100);
    DECLARE v_EmployeeID INT;

    -- Get the EquipmentID from Maintenance table where Status = 'Pending'
    SELECT Equipment_ID INTO v_EquipmentID 
    FROM Maintenance 
    WHERE Maintenance_ID = p_MaintenanceID AND Status = 'Pending';

    -- If no matching MaintenanceID with 'Pending' status, exit
    IF v_EquipmentID IS NULL THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'No pending maintenance found!';
    END IF;

    -- Get the required specialization from the Equipment table
    SELECT Specialization INTO v_Specialization 
    FROM Equipment 
    WHERE EquipmentID = v_EquipmentID;

    -- Find an UNASSIGNED employee with matching specialty
    SELECT SSN INTO v_EmployeeID
    FROM Employee
    WHERE Specialty = v_Specialization
    AND Status = 'Unassigned'
    LIMIT 1;

    -- If no unassigned employee is found, exit
    IF v_EmployeeID IS NULL THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'No available unassigned employee with required specialization!';
    END IF;

    -- Assign the maintenance task to the selected employee
    INSERT INTO MaintenanceRecord (SSN, MaintenanceID, HoursWorked, EmployeeID)
    VALUES (v_EmployeeID, p_MaintenanceID, 0, v_EmployeeID);

    -- Update the employee's status to 'Assigned'
    UPDATE Employee 
    SET Status = 'Assigned' 
    WHERE SSN = v_EmployeeID;

    -- Update Maintenance Status to 'In Progress'
    UPDATE Maintenance 
    SET Status = 'In Progress' 
    WHERE MaintenanceID = p_MaintenanceID;

END;

//
DELIMITER ;

DELIMITER $$

CREATE PROCEDURE AssignCompanyToMaintenance(IN maintenance_id INT)
BEGIN
    DECLARE company_id INT;
    
    -- Find a company that provides the required service
    SELECT mc.CompanyID 
    INTO company_id
    FROM MaintenanceCompany mc
    JOIN Maintenance m ON m.MaintenanceID = maintenance_id
    JOIN Equipment e ON m.EquipmentID = e.EquipmentID
    WHERE mc.ServicesProvided LIKE CONCAT('%', e.Specialization, '%')
    LIMIT 1;  -- Assign only one company

    -- If a company is found, insert into OutsourcedTo table
    IF company_id IS NOT NULL THEN
        INSERT INTO OutsourcedTo (MaintenanceID, CompanyID, HoursWorked)
        VALUES (maintenance_id, company_id, 0);
        
        -- Update Maintenance status to "Assigned"
        UPDATE Maintenance
        SET Status = 'In Progress'
        WHERE MaintenanceID = maintenance_id;
    END IF;
END $$

DELIMITER ;

DESC Maintenance;

CALL AssignMaintenanceTask(32);
drop procedure AssignMaintenanceTask;

SELECT * FROM MaintenanceRecord WHERE MaintenanceID = 22;

DELIMITER $$

CREATE PROCEDURE AssignCompanyToMaintenance(IN maintenance_id INT)
BEGIN
    DECLARE company_id INT;

    -- Find a compatible company with the least maintenance tasks assigned
    SELECT mc.CompanyID
    INTO company_id
    FROM MaintenanceCompany mc
    JOIN Maintenance m ON m.MaintenanceID = maintenance_id
    JOIN Equipment e ON m.EquipmentID = e.EquipmentID
    LEFT JOIN OutsourcedTo ot ON mc.CompanyID = ot.CompanyID
    WHERE mc.ServicesProvided LIKE CONCAT('%', e.Specialization, '%')
    GROUP BY mc.CompanyID
    ORDER BY COUNT(ot.MaintenanceID) ASC, mc.CompanyID ASC
    LIMIT 1;

    -- If a company is found, insert into OutsourcedTo table
    IF company_id IS NOT NULL THEN
        INSERT INTO OutsourcedTo (MaintenanceID, CompanyID, HoursWorked)
        VALUES (maintenance_id, company_id, 0);
        
        -- Update Maintenance status to "In Progress"
        UPDATE Maintenance
        SET Status = 'In Progress'
        WHERE MaintenanceID = maintenance_id;
    END IF;
END $$

DELIMITER ;

CALL AssignCompanyToMaintenance(31);

DELIMITER $$

CREATE PROCEDURE UpdateMaintenanceStatus(
    IN p_MaintenanceID INT,
    IN p_NewStatus ENUM('Pending', 'In Progress', 'Completed', 'Cancelled')
)
BEGIN
    DECLARE v_EquipmentID INT;
    DECLARE v_ComponentID INT;
    DECLARE v_InventoryLevel INT;
    DECLARE v_EmployeeID INT;
    DECLARE done INT DEFAULT 0;

    -- Cursor to fetch components of the equipment
    DECLARE component_cursor CURSOR FOR 
        SELECT ComponentID, InventoryLevel FROM Component WHERE EquipmentID = v_EquipmentID;

    -- Cursor to fetch employees assigned to this maintenance task
    DECLARE employee_cursor CURSOR FOR 
        SELECT EmployeeID FROM MaintenanceRecord WHERE MaintenanceID = p_MaintenanceID;

    -- Declare handlers for cursor end
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

    -- Start transaction
    START TRANSACTION;

    -- Update maintenance status
    UPDATE Maintenance 
    SET Status = p_NewStatus 
    WHERE MaintenanceID = p_MaintenanceID;

    -- If status is 'Completed', process components and unassign employees
    IF p_NewStatus = 'Completed' THEN
        -- Get EquipmentID for the given maintenance task
        SELECT EquipmentID INTO v_EquipmentID FROM Maintenance WHERE MaintenanceID = p_MaintenanceID;

        -- Open component cursor to iterate over components
        OPEN component_cursor;

        component_loop: LOOP
            FETCH component_cursor INTO v_ComponentID, v_InventoryLevel;
            IF done = 1 THEN 
                LEAVE component_loop; 
            END IF;

            -- Ensure inventory is available before decrementing
            IF v_InventoryLevel > 0 THEN
                UPDATE Component 
                SET InventoryLevel = GREATEST(v_InventoryLevel - 1, 0)
                WHERE ComponentID = v_ComponentID;

                -- Insert replacement record
                INSERT INTO ComponentReplacement (ComponentID, EquipmentID, ReplacementDate, ManHoursUsed, QuantityUsed)
                VALUES (v_ComponentID, v_EquipmentID, CURDATE(), 2, 1);
            END IF;
        END LOOP;

        -- Close component cursor
        CLOSE component_cursor;

        -- Reset done flag
        SET done = 0;

        -- Open employee cursor
        OPEN employee_cursor;

        employee_loop: LOOP
            FETCH employee_cursor INTO v_EmployeeID;
            IF done = 1 THEN 
                LEAVE employee_loop; 
            END IF;

            -- Mark employee as 'Unassigned'
            UPDATE Employee 
            SET Status = 'Unassigned'
            WHERE SSN = v_EmployeeID;
        END LOOP;

        -- Close employee cursor
        CLOSE employee_cursor;
    END IF;

    -- Commit transaction
    COMMIT;
END $$

DELIMITER ;


select * from  maintenancerecord;

use equipmentmaintenancenew;

-- Procedures for Employee Routes

DELIMITER $$

-- Get all employees
CREATE PROCEDURE GetAllEmployees()
BEGIN
    SELECT SSN, Name, Address, Department, Specialty, EmploymentDate, Status 
    FROM Employee;
END$$

-- Get a specific employee
CREATE PROCEDURE GetEmployee(IN empSSN INT)
BEGIN
    SELECT SSN, Name, Address, Department, Specialty, EmploymentDate, Status 
    FROM Employee WHERE SSN = empSSN;
END$$

-- Add a new employee
CREATE PROCEDURE AddEmployee(
    IN empSSN INT, 
    IN empName VARCHAR(255), 
    IN empAddress VARCHAR(255), 
    IN empDepartment VARCHAR(100), 
    IN empSpecialty VARCHAR(100), 
    IN empEmploymentDate DATE, 
    IN empStatus VARCHAR(50)
)
BEGIN
    INSERT INTO Employee (SSN, Name, Address, Department, Specialty, EmploymentDate, Status)
    VALUES (empSSN, empName, empAddress, empDepartment, empSpecialty, empEmploymentDate, empStatus);
END$$

-- Update an employee
CREATE PROCEDURE UpdateEmployee(
    IN empSSN INT, 
    IN empName VARCHAR(255), 
    IN empAddress VARCHAR(255), 
    IN empDepartment VARCHAR(100), 
    IN empSpecialty VARCHAR(100), 
    IN empEmploymentDate DATE, 
    IN empStatus VARCHAR(50)
)
BEGIN
    UPDATE Employee 
    SET Name = empName, 
        Address = empAddress, 
        Department = empDepartment, 
        Specialty = empSpecialty, 
        EmploymentDate = empEmploymentDate,
        Status = empStatus
    WHERE SSN = empSSN;
END$$

-- Delete an employee
CREATE PROCEDURE DeleteEmployee(IN empSSN INT)
BEGIN
    DELETE FROM Employee WHERE SSN = empSSN;
END$$

-- Assign a maintenance task to an employee
CREATE PROCEDURE AssignTask(
    IN empSSN INT, 
    IN maintenanceID INT
)
BEGIN
    INSERT INTO MaintenanceRecord (SSN, MaintenanceID, HoursWorked) 
    VALUES (empSSN, maintenanceID, 0);
END$$

-- Get employee performance report
CREATE PROCEDURE GetEmployeePerformance()
BEGIN
    SELECT e.Name, COUNT(mr.MaintenanceID) AS JobsCompleted, 
           COALESCE(SUM(mr.HoursWorked), 0) AS HoursWorked 
    FROM Employee e
    LEFT JOIN MaintenanceRecord mr ON e.SSN = mr.SSN
    GROUP BY e.SSN, e.Name;
END$$

DELIMITER ;



-- Reports --

-- 1. Equipment Maintenance Reports : Breakdown vs. Shutdown Costs

DELIMITER $$

CREATE PROCEDURE GetEquipmentCosts()
BEGIN
    SELECT Name, BreakdownCost, 
           (ShutdownHours * (PurchaseCost / Lifetime)) AS ShutdownCost
    FROM Equipment;
END $$

DELIMITER ;

call GetEquipmentCosts;

-- 2. Employee Performance Reports : Employee Workload

DELIMITER $$
CREATE PROCEDURE GetEmployeeWorkload()
BEGIN
    SELECT E.Name, SUM(MR.HoursWorked) AS TotalHoursWorked
    FROM MaintenanceRecord MR
    JOIN Employee E ON MR.EmployeeID = E.SSN
    GROUP BY E.Name;
END $$

DELIMITER ;

-- 3. Maintenance Status & Performance : Pending vs. Completed Maintenance Jobs

DELIMITER $$

CREATE PROCEDURE GetMaintenanceStatus()
BEGIN
    SELECT Status, COUNT(*) AS JobCount
    FROM Maintenance
    GROUP BY Status;
END $$

DELIMITER ;

-- 4. Component Usage & Inventory Reports : 
--  - Most Frequently Replaced Components

DELIMITER $$

CREATE PROCEDURE GetMostReplacedComponents()
BEGIN
    SELECT C.Name, COUNT(CR.ComponentID) AS ReplacementCount
    FROM ComponentReplacement CR
    JOIN Component C ON CR.ComponentID = C.ComponentID
    GROUP BY C.Name
    ORDER BY ReplacementCount DESC
    LIMIT 10;
END $$

DELIMITER ;

-- - Low Inventory Components

DELIMITER $$

CREATE PROCEDURE GetLowInventoryComponents()
BEGIN
    SELECT Name, InventoryLevel
    FROM Component
    WHERE InventoryLevel < 10;
END $$

DELIMITER ;
drop PROCEDURE GetLowInventoryComponents;

-- 5. Outsourced Maintenance Reports : Hours Worked by Outsourced Companies

DELIMITER $$

CREATE PROCEDURE GetOutsourcedHours()
BEGIN
    SELECT MC.Name, SUM(O.HoursWorked) AS TotalHoursWorked
    FROM OutsourcedTo O
    JOIN MaintenanceCompany MC ON O.CompanyID = MC.CompanyID
    GROUP BY MC.Name;
END $$

DELIMITER ;

-- Charts --
-- 1. Breakdown vs. Shutdown Costs per Equipment
DELIMITER //

CREATE PROCEDURE GetBreakdownVsShutdownCosts()
BEGIN
    SELECT 
        e.Name AS EquipmentName,
        SUM(CASE WHEN m.Type = 'Breakdown' THEN e.BreakdownCost ELSE 0 END) AS BreakdownCost,
        SUM(CASE WHEN m.Type = 'Shutdown' THEN e.ShutdownHours ELSE 0 END) AS ShutdownCost
    FROM Equipment e
    JOIN Maintenance m ON e.EquipmentID = m.EquipmentID
    GROUP BY e.EquipmentID;
END //

DELIMITER ;

-- 2. Maintenance Cost Trend Over Time
DELIMITER //

CREATE PROCEDURE GetMaintenanceCostTrend()
BEGIN
    SELECT 
        m.Type,
        DATE(mr.ReplacementDate) AS Date,
        SUM(e.BreakdownCost) AS BreakdownCost,
        SUM(e.ShutdownHours) AS ShutdownCost
    FROM Maintenance m
    JOIN Equipment e ON m.EquipmentID = e.EquipmentID
    LEFT JOIN ComponentReplacement mr ON e.EquipmentID = mr.EquipmentID
    GROUP BY Date, m.Type
    ORDER BY Date;
END //

DELIMITER ;

-- 3. Total Hours Worked by Employees
DELIMITER //

CREATE PROCEDURE GetTotalHoursWorkedByEmployees()
BEGIN
    SELECT 
        e.Name AS EmployeeName,
        SUM(mr.HoursWorked) AS TotalHoursWorked
    FROM Employee e
    JOIN MaintenanceRecord mr ON e.SSN = mr.EmployeeID
    GROUP BY e.SSN;
END //

DELIMITER ;

-- 4. Employee Work Trend Over Time
DELIMITER //

CREATE PROCEDURE GetEmployeeWorkTrend()
BEGIN
    SELECT 
        DATE(mr.ReplacementDate) AS WorkDate,
        SUM(mr.HoursWorked) AS TotalHoursWorked
    FROM MaintenanceRecord mr
    GROUP BY WorkDate
    ORDER BY WorkDate;
END //

DELIMITER ;

-- 5. Maintenance Completion Trend
DELIMITER //

CREATE PROCEDURE GetMaintenanceCompletionTrend()
BEGIN
    SELECT 
        DATE(mr.ReplacementDate) AS CompletionDate,
        COUNT(m.MaintenanceID) AS CompletedTasks
    FROM Maintenance m
    JOIN ComponentReplacement mr ON m.EquipmentID = mr.EquipmentID
    WHERE m.Status = 'Completed'
    GROUP BY CompletionDate
    ORDER BY CompletionDate;
END //

DELIMITER ;

-- 6. Most Replaced Components
DELIMITER //

CREATE PROCEDURE GetMostReplacedComponents()
BEGIN
    SELECT 
        c.Name AS ComponentName,
        COUNT(cr.ComponentID) AS ReplacementCount
    FROM ComponentReplacement cr
    JOIN Component c ON cr.ComponentID = c.ComponentID
    GROUP BY c.ComponentID
    ORDER BY ReplacementCount DESC
    LIMIT 10;
END //

DELIMITER ;

-- 7. Component Costs Over Time
DELIMITER //

CREATE PROCEDURE GetComponentCostsOverTime()
BEGIN
    SELECT 
        DATE(cr.ReplacementDate) AS ReplacementDate,
        SUM(c.UnitCost * cr.QuantityUsed) AS TotalCost
    FROM ComponentReplacement cr
    JOIN Component c ON cr.ComponentID = c.ComponentID
    GROUP BY ReplacementDate
    ORDER BY ReplacementDate;
END //

DELIMITER ;

-- 8. Most Active Maintenance Companies
 DELIMITER //

CREATE PROCEDURE GetMostActiveMaintenanceCompanies()
BEGIN
    SELECT 
        mc.Name AS CompanyName,
        COUNT(o.MaintenanceID) AS WorkCount
    FROM OutsourcedTo o
    JOIN MaintenanceCompany mc ON o.CompanyID = mc.CompanyID
    GROUP BY mc.CompanyID
    ORDER BY WorkCount DESC;
END //

DELIMITER ;

-- 9. Outsourced vs. In-House Hours Over Time
DELIMITER //

CREATE PROCEDURE GetOutsourcedVsInHouseHours()
BEGIN
    SELECT 
        DATE(mr.ReplacementDate) AS WorkDate,
        SUM(CASE WHEN o.CompanyID IS NOT NULL THEN o.HoursWorked ELSE 0 END) AS OutsourcedHours,
        SUM(CASE WHEN o.CompanyID IS NULL THEN mr.HoursWorked ELSE 0 END) AS InHouseHours
    FROM MaintenanceRecord mr
    LEFT JOIN OutsourcedTo o ON mr.MaintenanceID = o.MaintenanceID
    GROUP BY WorkDate
    ORDER BY WorkDate;
END //

DELIMITER ;

DELIMITER $$

CREATE PROCEDURE AssignMaintenanceIfEmployeeExists(
    IN input_maintenance_id INT,
    OUT result_status VARCHAR(10),
    OUT result_message VARCHAR(255)
)
BEGIN
    DECLARE assigned_count INT;

    -- Count how many assignments exist for the given MaintenanceID
    SELECT COUNT(*) INTO assigned_count
    FROM MaintenanceRecord
    WHERE MaintenanceID = input_maintenance_id;

    IF assigned_count > 0 THEN
        -- Update Maintenance status to 'In Progress'
        UPDATE Maintenance
        SET Status = 'In Progress'
        WHERE MaintenanceID = input_maintenance_id;

        SET result_status = 'success';
        SET result_message = 'Maintenance assigned successfully!';
    ELSE
        SET result_status = 'failed';
        SET result_message = 'No employees available. Redirecting to company assignment...';
    END IF;
END$$

DELIMITER ;
