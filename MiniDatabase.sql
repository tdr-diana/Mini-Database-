/*CREATE TABLE Proposal (
    IdProposal INT NOT NULL,
    title VARCHAR(30) NOT NULL,
    description VARCHAR(100) DEFAULT NULL,
    PRIMARY KEY (IdProposal)
);

CREATE TABLE Citizen (
    IdCitizen INT NOT NULL,
    first_name VARCHAR(30),
    last_name VARCHAR(30),
    age INT,
    PRIMARY KEY (IdCitizen),
    CHECK (age>=18)
);

CREATE TABLE Municipal_Bodies (
    IdBodies INT NOT NULL,
    specialization VARCHAR(30) NOT NULL,
    PRIMARY KEY (IdBodies)
);

CREATE TABLE Council_Services (
    IdCouncil INT NOT NULL,
    no_members INT NOT NULL,
    PRIMARY KEY (IdCouncil)
);

CREATE TABLE Execution_Phase (
    IdPhase INT NOT NULL,
    name_phase VARCHAR(30),
    description VARCHAR(100),
    PRIMARY KEY(IdPhase)
);

CREATE TABLE Stage (
    IdStage INT NOT NULL,
    name_stage VARCHAR(30),
    PRIMARY KEY (IdStage)
);

CREATE TABLE Budget (
    IdBudget INT NOT NULL,
    limit_amount INT
    PRIMARY KEY (IdBudget)
);

CREATE TABLE Construction_Companies (
    IdCompany INT NOT NULL,
    specialization VARCHAR(30),
    description VARCHAR(100),
    PRIMARY KEY (IdCompany)
);

CREATE TABLE Consortia (
    IdConsortia INT NOT NULL,
    no_companies INT,
    name VARCHAR(30),
    PRIMARY KEY (IdConsortia)
);

CREATE TABLE Work_report (
    IdReport INT NOT NULL,
    description VARCHAR(100),
    IdProposal INT,
    PRIMARY KEY (IdReport),
    FOREIGN KEY (IdProposal) REFERENCES Proposal(IdProposal)
);

CREATE TABLE Register (
    IdProposal INT,
    IdCitizen INT,
    date_proposal DATE,
    PRIMARY KEY (IdProposal, IdCitizen),
    FOREIGN KEY (IdProposal) REFERENCES Proposal(IdProposal),
    FOREIGN KEY (IdCitizen) REFERENCES Citizen(IdCitizen)
);

CREATE TABLE Analyse (
    IdProposal INT,
    IdCouncil INT,
    start_impl DATE,
    end_impl DATE,
    total_amount INT,
    PRIMARY KEY (IdProposal, IdCouncil),
    FOREIGN KEY (IdProposal) REFERENCES Proposal(IdProposal),
    FOREIGN KEY (IdCouncil) REFERENCES Council_Services(IdCouncil),
    CHECK (start_impl<end_impl)
);

CREATE TABLE Consult (
    IdProposal INT,
    IdCitizen INT,
    start_date DATE,
    end_date DATE,
    rate INT,
    justification VARCHAR(100),
    PRIMARY KEY (IdProposal, IdCitizen),
    FOREIGN KEY (IdProposal) REFERENCES Proposal(IdProposal),
    FOREIGN KEY (IdCitizen) REFERENCES Citizen(IdCitizen),
     CHECK (start_date<end_date)
);

CREATE TABLE State_opinion (
    IdProposal INT,
    IdBodies INT,
    opinion VARCHAR(100),
    PRIMARY KEY (IdProposal, IdBodies),
    FOREIGN KEY (IdProposal) REFERENCES Proposal(IdProposal),
    FOREIGN KEY (IdBodies) REFERENCES Municipal_Bodies(IdBodies)
);

CREATE TABLE Clarify (
    IdProposal INT,
    IdBodies INT,
    associated_opinion VARCHAR(100),
    PRIMARY KEY (IdProposal, IdBodies),
    FOREIGN KEY (IdProposal) REFERENCES Proposal(IdProposal),
    FOREIGN KEY (IdBodies) REFERENCES Municipal_Bodies(IdBodies)
);

CREATE TABLE Has_Stage (
    IdProposal INT,
    IdStage INT,
    start_stage DATE,
    PRIMARY KEY (IdProposal, IdStage),
    FOREIGN KEY (IdProposal) REFERENCES Proposal(IdProposal),
    FOREIGN KEY (IdStage) REFERENCES Stage(IdStage)
);

CREATE TABLE Generates (
    IdProposal INT,
    IdPhase INT,
    start_phase DATE,
    end_phase DATE,
    amount_phase INT,
    percentage DECIMAL(5,2),
    PRIMARY KEY (IdProposal, IdPhase),
    FOREIGN KEY (IdProposal) REFERENCES Proposal(IdProposal),
    FOREIGN KEY (IdPhase) REFERENCES Execution_Phase(IdPhase),
     CHECK (start_phase<end_phase)
);

CREATE TABLE Submit_Quote_Company (
    IdBudget INT,
    IdCompany INT,
    execution_date DATE,
    offer INT,
    PRIMARY KEY (IdBudget, IdCompany),
    FOREIGN KEY (IdBudget) REFERENCES Budget(IdBudget),
    FOREIGN KEY (IdCompany) REFERENCES Construction_Companies(IdCompany)
);

CREATE TABLE Forms (
    IdConsortia INT,
    IdCompany INT,
    incorporation_date DATE,
    PRIMARY KEY (IdConsortia, IdCompany),
    FOREIGN KEY (IdConsortia) REFERENCES Consortia(IdConsortia),
    FOREIGN KEY (IdCompany) REFERENCES Construction_Companies(IdCompany)
);

CREATE TABLE Submit_Quote_Consortia (
    IdBudget INT,
    IdConsortia INT,
    execution_date DATE,
    offer INT,
    PRIMARY KEY (IdBudget, IdConsortia),
    FOREIGN KEY (IdBudget) REFERENCES Budget(IdBudget),
    FOREIGN KEY (IdConsortia) REFERENCES Consortia(IdConsortia)
);

CREATE TABLE Has_Budget (
    IdProposal INT,
    IdBudget INT,
    final_cost INT,
    PRIMARY KEY (IdProposal, IdBudget),
    FOREIGN KEY (IdProposal) REFERENCES Proposal(IdProposal),
    FOREIGN KEY (IdBudget) REFERENCES Budget(IdBudget)
);

INSERT INTO Citizen VALUES
(1, 'David', 'Cherry', 45),
(2, 'Victor', 'Spears', 40),
(3, 'Andrea', 'Parker', 36),
(4, 'Rita', 'Gaurita', 18),
(5, 'Rita', 'Aurita', 25),
(6, 'Donald', 'West', 42),
(7, 'Vanessa', 'Mccoy', 45),
(8, 'Nathan', 'Scott', 35),
(9, 'Jose', 'May', 47),
(10, 'Marcus', 'Ellis', 29),
(11, 'Melissa', 'Harris', 29),
(12, 'Sarah', 'Santiago', 34),
(13, 'Lauren', 'Lee', 30),
(14, 'Veronica', 'Richardson', 52),
(15, 'Edward', 'Molina', 61),
(16, 'Kenneth', 'Arias', 41),
(17, 'Susan', 'Gonzalez', 33),
(18, 'Michelle', 'Watkins', 63),
(19, 'Carl', 'Richardson', 48),
(20, 'Annette', 'Bates', 42);

INSERT INTO Proposal VALUES
(1, 'Community Garden', 'Establish a local community garden'),
(2, 'Public Library Renovation', 'Renovate and modernize the public library'),
(3, 'New Bike Lanes', 'Construct bike lanes along the main road'),
(4, 'Playground Installation', 'Install a new playground in the central park'),
(5, 'Community WiFi Project', 'Implement free public WiFi across the neighborhood');

INSERT INTO Municipal_Bodies VALUES
(1, 'Urban Development'),
(2, 'Public Works'),
(3, 'Environmental Protection');


INSERT INTO Council_Services VALUES
(1, 10),
(2, 12),
(3, 8);

INSERT INTO Execution_Phase VALUES
(1, 'Earthworks', 'Excavation, leveling, and grading'),
(2, 'Foundation', 'Construction of the structural base'),
(3, 'Hydraulic installations', 'Water supply, drainage, and sanitation systems'),
(4, 'Electrical installations', 'Wiring, panels, lighting, and power distribution systems'),
(5, 'Roofing', 'Waterproofing of the building s roof to ensure structural integrity and protection'),
(6, 'Finishing', 'Final touches including painting, flooring, carpentry, and fixture installations');

INSERT INTO Stage VALUES
(1, 'Feasability Study'),
(2, 'Analysis by Citizens'),
(3, 'Approved for Execution'),
(4, 'Rejected for Execution'),
(5, 'Budgeting'),
(6, 'Execution Analysis'),
(7, 'Approved Status'),
(8, 'Unviable Status');

INSERT INTO Budget VALUES
(1, 60000),
(2, 80000),
(3, 90000),
(4, 20000),
(5, 100000);

INSERT INTO Construction_Companies VALUES
(1, 'Earthworks', 'Experts in excavation and terrain leveling'),
(2, 'Foundation', 'Specialists in concrete and structural foundations'),
(3, 'Hydraulic installations', 'Plumbing and water systems experts'),
(4, 'Electrical installations', 'Electrical wiring and power systems installation'),
(5, 'Roofing', 'Professional roofing and waterproofing services'),
(6, 'Finishing', 'Interior and exterior finishing specialists');


INSERT INTO Consortia VALUES
(1, 2, 'UrbanGroup'),
(2, 5, 'InfraAlliance'),
(3, 4, 'GreenFuture');

INSERT INTO Register VALUES
(1, 1, '2024-01-10'),
(2, 2, '2024-02-12'),
(3, 3, '2024-04-15'),
(4, 5, '2024-04-20'),
(5, 10, '2024-06-18'),
(2, 11, '2024-03-20');

INSERT INTO Analyse VALUES
(1, 1, '2024-02-01', '2024-02-10', 50000),
(2, 2, '2024-03-01', '2024-03-15', 75000),
(3, 3, '2024-05-01', '2024-05-20', 60000),
(4, 2, '2024-05-12', '2024-06-01', 19000),
(5, 3, '2024-04-01', '2024-04-25', 90000);

INSERT INTO Consult VALUES
(1, 2, '2025-01-11', '2025-01-20', 10, 'Strong support'),
(2, 1, '2025-02-13', '2025-04-25', 4, 'Well received'),
(3, 3, '2024-05-20', '2024-06-25', 3, 'Mixed opinions'),
(2, 5, '2025-03-13', '2025-04-25', 8, 'Mixed opinions'),
(3, 4, '2024-05-20', '2024-06-25', 10, 'Strong support'),
(3, 2, '2024-05-20', '2024-06-25', 8, 'Mixed opinions'),
(3, 12, '2024-05-20', '2024-06-25', 10, 'Strong support'),
(3, 15, '2024-05-20', '2024-06-25', 10, 'Love this!'),
(3, 16, '2024-05-20', '2024-06-25', 7, 'Mixed opinions'),
(3, 19, '2024-05-20', '2024-06-25', 9, 'Strong support'),
(3, 17, '2024-05-20', '2024-06-25', 6, 'Mixed opinions'),
(3, 20, '2024-05-20', '2024-06-25', 9, 'Mixed opinions'),
(3, 14, '2024-05-20', '2024-06-25', 9, 'Strong support'),
(3, 6, '2024-05-20', '2024-06-25', 9, 'Super we need this!');

INSERT INTO State_opinion VALUES
(1, 1, 'Approved with minor changes'),
(2, 2, 'Fully supported'),
(3, 3, 'Needs environmental assessment'),
(4, 2, 'Fully supported'),
(5, 2, 'Needs environmental assessment');

INSERT INTO Clarify VALUES
(1, 1, 'Details on maintenance plan required'),
(2, 2, 'Clarify budget breakdown'),
(3, 3, 'Provide waste management strategy'),
(4, 2, 'No clarification needed'),
(5, 1, 'Clarify budget breakdown');

INSERT INTO Has_Stage (IdProposal, IdStage, start_stage) VALUES
(1, 1, '2025-01-10'),
(1, 2, '2025-01-15'), 
(1, 3, '2025-01-20'), 
(1, 5, '2025-01-30'), 
(1, 6, '2025-02-04'),
(1, 7, '2025-02-09'),

(2, 1, '2025-02-13'),
(2, 2, '2025-02-18'),
(2, 4, '2025-02-28'),

(3, 1, '2025-03-16'), 
(3, 2, '2025-03-21'), 
(3, 3, '2025-03-26'),
(3, 5, '2025-04-05'), 
(3, 6, '2025-04-10'), 
(3, 7, '2025-04-15'),

(4, 1, '2025-04-01'), 
(4, 2, '2025-04-06'), 
(4, 3, '2025-04-11'),
(4, 5, '2025-04-21'), 
(4, 6, '2025-04-26'), 
(4, 8, '2025-05-01'),

(5, 1, '2025-05-01'),
(5, 2, '2025-05-06'), 
(5, 3, '2025-05-11'),
(5, 5, '2025-05-21'), 
(5, 6, '2025-05-26'), 
(5, 8, '2025-05-31');

INSERT INTO Generates VALUES
(1, 1, '2025-01-01', '2025-01-06', 10000, 15.00),
(1, 2, '2025-01-07', '2025-01-12', 12000, 20.00),
(1, 3, '2025-01-13', '2025-01-18', 8000, 13.33),
(1, 4, '2025-01-19', '2025-01-24', 9000, 15.00),
(1, 5, '2025-01-25', '2025-01-30', 7000, 11.67),
(1, 6, '2025-01-31', '2025-02-05', 6000, 10.00),

(3, 1, '2025-03-01', '2025-03-06', 15000, 25.00),
(3, 2, '2025-03-07', '2025-03-12', 14000, 23.33),
(3, 3, '2025-03-13', '2025-03-18', 10000, 16.67),
(3, 4, '2025-03-19', '2025-03-24', 8000, 13.33),
(3, 5, '2025-03-25', '2025-03-30', 6000, 10.00),
(3, 6, '2025-03-31', '2025-04-05', 5000, 8.33),

(4, 1, '2025-04-01', '2025-04-06', 9000, 15.00),
(4, 2, '2025-04-07', '2025-04-12', 10000, 16.67),
(4, 3, '2025-04-13', '2025-04-18', 8500, 14.17),
(4, 4, '2025-04-19', '2025-04-24', 9500, 15.83),
(4, 5, '2025-04-25', '2025-04-30', 8000, 13.33),
(4, 6, '2025-05-01', '2025-05-06', 7000, 11.67),

(5, 1, '2025-05-01', '2025-05-06', 13000, 21.67),
(5, 2, '2025-05-07', '2025-05-12', 14000, 23.33),
(5, 3, '2025-05-13', '2025-05-18', 9000, 15.00),
(5, 4, '2025-05-19', '2025-05-24', 8000, 13.33),
(5, 5, '2025-05-25', '2025-05-30', 7000, 11.67),
(5, 6, '2025-05-31', '2025-06-05', 6000, 10.00);


UPDATE Has_Stage
SET start_stage = DATEADD(MONTH, 1, DATEADD(YEAR, -1, start_stage))
WHERE YEAR(start_stage) = 2025;

UPDATE Generates
SET start_phase = DATEADD(MONTH, 1, DATEADD(YEAR, -1, start_phase)),
    end_phase = DATEADD(MONTH, 1, DATEADD(YEAR, -1, end_phase))
WHERE YEAR(start_phase) = 2025 OR YEAR(end_phase) = 2025;

select * from Generates

INSERT INTO Submit_Quote_Company (IdBudget, IdCompany, execution_date, offer)
VALUES
-- Proposal 1
(1, 1, '2024-02-10', 15000),
(1, 2, '2024-02-11', 16000),
(1, 6, '2024-02-15', 20000),

-- Proposal 3
(3, 1, '2024-04-05', 16000),
(3, 2, '2024-04-06', 17000),
(3, 6, '2024-04-10', 21000),

-- Proposal 4
(4, 1, '2024-05-01', 14000),
(4, 2, '2024-05-02', 14500),
(4, 3, '2024-05-03', 15000),
(4, 4, '2024-05-04', 15500),
(4, 6, '2024-05-06', 16500),

-- Proposal 5
(5, 2, '2024-06-11', 17500),
(5, 4, '2024-06-13', 78500),
(5, 6, '2024-06-15', 19500);


INSERT INTO Forms VALUES
(1, 1, '2024-01-15'),
(1, 2,'2024-01-01' ),
(1, 6, '2024-01-14'),
(2, 1, '2024-01-11'),
(2, 2, '2024-01-21' ),
(2, 6, '2024-01-13'),
(2, 4, '2025-02-18'),
(3, 3, '2025-03-20'),
(3, 5, '2025-02-20'),
(3, 2, '2025-01-20');

INSERT INTO Submit_quote_Consortia VALUES
(1, 1, '2024-02-25', 53000),
(3, 2 , '2024-04-30', 86000),
(4, 1 , '2024-04-30', 96000),
(5, 3 , '2024-04-30', 110000);

INSERT INTO Has_Budget VALUES
(1, 1, 53000),
(3, 3, 78000),
(4, 4, 96000),
(5, 5, 110000);

INSERT INTO Work_report VALUES
(1, 'Initial setup and clearance complete', 1),
(2, 'Foundation work underway', 3);

CREATE TABLE Neighborhood (
    IdNei INT,
    street VARCHAR(30),
    number INT,
    PRIMARY KEY (IdNei)
);

ALTER TABLE Citizen 
ADD IdNei INT;

ALTER TABLE Citizen
ADD CONSTRAINT tb_citizen_FK
FOREIGN KEY (IdNei) REFERENCES Neighborhood (IdNei);

INSERT INTO Neighborhood (IdNei, street, number) VALUES
(1, 'Main Street', 101),
(2, 'Elm Avenue', 45),
(3, 'Oak Lane', 77),
(4, 'Pine Road', 22),
(5, 'Maple Boulevard', 10);

ALTER TABLE Construction_Companies 
ADD no_workers INT

UPDATE Construction_Companies
SET no_workers = 50
WHERE IdCompany = 1;

UPDATE Construction_Companies
SET no_workers = 75
WHERE IdCompany = 2;

UPDATE Construction_Companies
SET no_workers = 50
WHERE IdCompany = 3;

UPDATE Construction_Companies
SET no_workers = 80
WHERE IdCompany = 4;

UPDATE Construction_Companies
SET no_workers = 75
WHERE IdCompany = 5;

UPDATE Construction_Companies
SET no_workers = 90
WHERE IdCompany = 6;

--1
SELECT * FROM Citizen
SELECT * FROM Proposal
SELECT * FROM Municipal_Bodies
SELECT * FROM Council_Services
SELECT * FROM Execution_Phase
SELECT * FROM Stage
SELECT * FROM Budget
SELECT * FROM Construction_Companies
SELECT * FROM Consortia
SELECT * FROM Work_report
SELECT * FROM Neighborhood
SELECT * FROM Register
SELECT * FROM Analyse
SELECT * FROM Consult
SELECT * FROM State_opinion
SELECT * FROM Clarify
SELECT * FROM Has_Stage
SELECT * FROM Generates
SELECT * FROM Submit_Quote_Company
SELECT * FROM Forms
SELECT * FROM Submit_Quote_Consortia
SELECT * FROM Has_Budget

UPDATE Citizen SET IdNei = 1 WHERE IdCitizen = 1;
UPDATE Citizen SET IdNei = 2 WHERE IdCitizen = 2;
UPDATE Citizen SET IdNei = 3 WHERE IdCitizen = 3;
UPDATE Citizen SET IdNei = 4 WHERE IdCitizen = 4;
UPDATE Citizen SET IdNei = 5 WHERE IdCitizen = 5;
UPDATE Citizen SET IdNei = 1 WHERE IdCitizen = 6;
UPDATE Citizen SET IdNei = 2 WHERE IdCitizen = 7;
UPDATE Citizen SET IdNei = 3 WHERE IdCitizen = 8;
UPDATE Citizen SET IdNei = 4 WHERE IdCitizen = 9;
UPDATE Citizen SET IdNei = 5 WHERE IdCitizen = 10;
UPDATE Citizen SET IdNei = 1 WHERE IdCitizen = 11;
UPDATE Citizen SET IdNei = 2 WHERE IdCitizen = 12;
UPDATE Citizen SET IdNei = 3 WHERE IdCitizen = 13;
UPDATE Citizen SET IdNei = 4 WHERE IdCitizen = 14;
UPDATE Citizen SET IdNei = 5 WHERE IdCitizen = 15;
UPDATE Citizen SET IdNei = 1 WHERE IdCitizen = 16;
UPDATE Citizen SET IdNei = 2 WHERE IdCitizen = 17;
UPDATE Citizen SET IdNei = 3 WHERE IdCitizen = 18;
UPDATE Citizen SET IdNei = 4 WHERE IdCitizen = 19;
UPDATE Citizen SET IdNei = 5 WHERE IdCitizen = 20; */

--2
SELECT * 
FROM Citizen C INNER JOIN Register R ON C.IdCitizen=R.IdCitizen
WHERE C.first_name='Rita'  AND MONTH(R.date_proposal) IN (4,5,6)
ORDER BY C.first_name DESC;

--3
SELECT C.first_name, COUNT(P.IdProposal) AS Prop_Number
FROM (Citizen C LEFT OUTER JOIN Register R ON C.IdCitizen=R.IdCitizen)
      LEFT OUTER JOIN Proposal P ON R.IdProposal=P.IdProposal
GROUP BY C.first_name
ORDER BY Prop_Number DESC 


--4
SELECT C.first_name, COUNT(P.IdProposal) AS Prop_Number
FROM (Citizen C LEFT OUTER JOIN Register R ON C.IdCitizen=R.IdCitizen)
      LEFT OUTER JOIN Proposal P ON R.IdProposal=P.IdProposal
GROUP BY C.first_name
HAVING COUNT(P.IdProposal)=0
ORDER BY C.first_name ASC

--5
SELECT P.title, AVG(CC.rate) AS AVG_RATE
FROM Proposal P INNER JOIN Consult CC ON P.IdProposal=CC.IdProposal
GROUP BY P.title
HAVING AVG(CC.rate)>=8 AND COUNT(CC.IdCitizen)>=10
ORDER BY AVG_RATE

--6

SELECT CC.IdCompany, CC.specialization, CC.description, C.name AS Consortium_name
FROM Construction_Companies CC
JOIN Forms F ON CC.IdCompany = F.IdCompany
JOIN (
    SELECT IdCompany, MIN(incorporation_date) AS min_date
    FROM Forms
    GROUP BY IdCompany
) Fmin ON F.IdCompany = Fmin.IdCompany AND F.incorporation_date = Fmin.min_date
JOIN Consortia C ON F.IdConsortia = C.IdConsortia;

--7
SELECT C.first_name, COUNT(R.IdProposal) AS proposal_count
FROM Citizen C
JOIN REGISTER R ON C.IdCitizen = R.IdCitizen
WHERE R.IdProposal IN (
    SELECT A1.IdProposal
    FROM Analyse A1
    CROSS JOIN Analyse A2 
    WHERE A1.total_amount = A2.total_amount AND A1.IdProposal <> A2.IdProposal
)
GROUP BY C.IdCitizen, C.first_name
HAVING COUNT(R.IdProposal) >= 2;

--8

SELECT  C.first_name,
    SUM(CASE WHEN MONTH(R.date_proposal) BETWEEN 1 AND 6 THEN 1 ELSE 0 END) AS FIRST_SEMESTER,
    SUM(CASE WHEN MONTH(R.date_proposal) BETWEEN 7 AND 12 THEN 1 ELSE 0 END) AS SECOND_SEMESTER
FROM Citizen C JOIN  Register R ON C.IdCitizen = R.IdCitizen
GROUP BY  C.first_name
HAVING 
    SUM(CASE WHEN MONTH(R.date_proposal) BETWEEN 1 AND 6 THEN 1 ELSE 0 END) > 0
    AND
    SUM(CASE WHEN MONTH(R.date_proposal) BETWEEN 7 AND 12 THEN 1 ELSE 0 END) > 0;


--9-le meu
SELECT N.street, COUNT(C.IdCitizen) AS NO_CITIZENS
FROM Neighborhood N LEFT OUTER JOIN Citizen C ON N.IdNei=C.IdNei
GROUP BY N.street
ORDER BY N.street DESC

--10
SELECT C.name, SUM(CC.no_workers)
FROM (Consortia C JOIN Forms F ON C.IdConsortia=F.IdConsortia) JOIN Construction_Companies CC ON F.IdCompany=CC.IdCompany
GROUP BY C.name
HAVING SUM(CC.no_workers)>200

--11
SELECT N.street, COUNT(C.IdCitizen) AS STREET_CITIZEN
FROM Neighborhood N LEFT OUTER JOIN Citizen C ON N.IdNei=C.IdNei
WHERE C.IdCitizen IN
(
    SELECT C1.IdCitizen
    FROM Citizen C1 JOIN Register R ON C1.IdCitizen=R.IdCitizen
)
GROUP BY N.street
ORDER BY N.street DESCs
