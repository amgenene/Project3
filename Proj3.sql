--Samantha Comeau and Cara Seely - sjcomeau cseely
DROP TABLE RoomAccess;
DROP TABLE Employee;
DROP TABLE Equipment;
DROP TABLE StayIn;
DROP TABLE RoomService;
DROP TABLE Examine;
DROP TABLE Admission;
DROP TABLE Patient;
DROP TABLE Doctor;
DROP TABLE Room;
DROP TABLE EquipmentType;
CREATE TABLE Patient(SSN CHAR(11) NOT NULL Primary Key, FirstName Varchar2(20), LastName Varchar2(20), Address Varchar2(100), TelNum INTEGER);
CREATE TABLE Admission(Num INTEGER NOT NULL Primary Key, AdmissionDate date, LeaveDate date, TotalPayment INTEGER, InsurancePayment INTEGER, FutureVisit date, Patient_SSN CHAR(11) REFERENCES Patient(SSN));
CREATE TABLE Doctor(ID CHAR(20) NOT NULL Primary Key, Gender CHAR(1) check (Gender = 'M' or Gender = 'F'), Specialty Varchar2(50), LastName Varchar2(20), FirstName Varchar2(20));
CREATE TABLE Examine(Comments Varchar2(200), DoctorID CHAR(20) REFERENCES Doctor(ID), AdmissionNum INTEGER REFERENCES Admission(Num));
CREATE TABLE Room(Num INTEGER Primary Key, occupiedFlag CHAR(1) check (occupiedFlag = 'T' or occupiedFlag = 'F'));
CREATE TABLE RoomService(Service Varchar2(50) NOT NULL Primary Key, roomNum INTEGER REFERENCES Room(Num));
CREATE TABLE StayIn(StartDate date NOT NULL Primary Key, endDate date, AdmissionNum INTEGER REFERENCES Admission(Num), RoomNum INTEGER REFERENCES Room(Num));
CREATE TABLE EquipmentType(ID CHAR(20) NOT NULL Primary Key, Description Varchar2(50), model REAL, Instructions Varchar2(200));
CREATE TABLE Equipment(SerialNum Varchar2(20), PurchaseYear INTEGER, LastInspection date, TypeID CHAR(20) REFERENCES EquipmentType(ID), roomNum INTEGER REFERENCES Room(Num));
CREATE TABLE Employee(ID CHAR(20) NOT NULL Primary Key, FName Varchar2(20), LName Varchar2(20), Salary INTEGER, jobTitle Varchar2(20), OfficeNum INTEGER, empRank INTEGER, supervisorID CHAR(20));
CREATE TABLE RoomAccess(roomNum INTEGER REFERENCES Room(Num), EmpID CHAR(20) REFERENCES Employee(ID));
INSERT INTO Patient (SSN, FirstName, LastName, Address, TelNum) VALUES (111-22-3330, 'Cara', 'Seely', '32 Old Farm Rd', 6033277761);
INSERT INTO Patient (SSN, FirstName, LastName, Address, TelNum) VALUES (111-22-3331, 'Samantha', 'Comeau', '100 Institute Rd', 6031112233);
INSERT INTO Patient (SSN, FirstName, LastName, Address, TelNum) VALUES (111-22-3332, 'Jeffrey', 'Chaves', '36 John St', 5089991010);
INSERT INTO Patient (SSN, FirstName, LastName, Address, TelNum) VALUES (111-22-3333, 'Naomi', 'Otoo', '139 Highland St', 6035984986);
INSERT INTO Patient (SSN, FirstName, LastName, Address, TelNum) VALUES (111-22-3334, 'Gabi', 'Money', '9 Goulding', 5087896767);
INSERT INTO Patient (SSN, FirstName, LastName, Address, TelNum) VALUES (111-22-3335, 'Jenn', 'Gagner', '9 Goulding', 6783277761);
INSERT INTO Patient (SSN, FirstName, LastName, Address, TelNum) VALUES (111-22-3336, 'Aimee', 'Bell', '6 Riley St', 6034987654);
INSERT INTO Patient (SSN, FirstName, LastName, Address, TelNum) VALUES (111-33-3337, 'Ayushka', 'Shrestha', '138 Highland St', 6034765432);
INSERT INTO Patient (SSN, FirstName, LastName, Address, TelNum) VALUES (111-33-3338, 'Sanara', 'Marsh', '567 Highland St', 5982345678);
INSERT INTO Patient (SSN, FirstName, LastName, Address, TelNum) VALUES (111-33-3339, 'Chris', 'Scangas', '56 John St', 2035986758);
INSERT INTO Doctor (ID, Gender, Specialty, LastName, FirstName) VALUES (12345123451234512345, 'M', 'Cardiology', 'Smith', 'David');
INSERT INTO Doctor (ID, Gender, Specialty, LastName, FirstName) VALUES (12345123451234512346, 'F', 'Pediatrics', 'Johnson', 'Lisa');
INSERT INTO Doctor (ID, Gender, Specialty, LastName, FirstName) VALUES (12345123451234512347, 'M', 'Cardiology', 'Ying', 'Lu');
INSERT INTO Doctor (ID, Gender, Specialty, LastName, FirstName) VALUES (12345123451234512348, 'M', 'Endocrinology', 'Grammenos', 'Alex');
INSERT INTO Doctor (ID, Gender, Specialty, LastName, FirstName) VALUES (12345123451234512349, 'F', 'Pediatrics', 'Goddard', 'Hannah');
INSERT INTO Doctor (ID, Gender, Specialty, LastName, FirstName) VALUES (12345123451234512341, 'M', 'Cancer', 'Burgess', 'Zach');
INSERT INTO Doctor (ID, Gender, Specialty, LastName, FirstName) VALUES (12345123451234512342, 'F', 'Nutrition', 'Laffer', 'Tess');
INSERT INTO Doctor (ID, Gender, Specialty, LastName, FirstName) VALUES (12345123451234512343, 'F', 'Cancer', 'Matthews', 'Jesse');
INSERT INTO Doctor (ID, Gender, Specialty, LastName, FirstName) VALUES (12345123451234612348, 'F', 'Pediatrics', 'Cromwell', 'Georgie');
INSERT INTO Doctor (ID, Gender, Specialty, LastName, FirstName) VALUES (12345123451234912348, 'M', 'Cardiology', 'Wang', 'James');
INSERT INTO Room (Num, occupiedFlag) VALUES (1,'T');
INSERT INTO Room (Num, occupiedFlag) VALUES (2,'T');
INSERT INTO Room (Num, occupiedFlag) VALUES (3,'T');
INSERT INTO Room (Num, occupiedFlag) VALUES (4,'T');
INSERT INTO Room (Num, occupiedFlag) VALUES (5,'T');
INSERT INTO Room (Num, occupiedFlag) VALUES (6,'F');
INSERT INTO Room (Num, occupiedFlag) VALUES (7,'F');
INSERT INTO Room (Num, occupiedFlag) VALUES (8,'F');
INSERT INTO Room (Num, occupiedFlag) VALUES (9,'F');
INSERT INTO Room (Num, occupiedFlag) VALUES (10,'F');
INSERT INTO RoomService (service, roomNum) VALUES ('ICU', 1);
INSERT INTO RoomService (service, roomNum) VALUES ('Baby Boy Delivery', 1);
INSERT INTO RoomService (service, roomNum) VALUES ('Baby Girl Delivery', 2);
INSERT INTO RoomService (service, roomNum) VALUES ('ICU', 2);
INSERT INTO RoomService (service, roomNum) VALUES ('Kidney Transplants', 3);
INSERT INTO RoomService (service, roomNum) VALUES ('Liver Transplants', 3);
INSERT INTO EquipmentType (ID, Description, model, Instructions) VALUES (12345123451234512345, 'MRI', 2.0, 'Position patient and press button');
INSERT INTO EquipmentType (ID, Description, model, Instructions) VALUES (12345123451234512346, 'Measures body temperature', 3.4, 'Run across forehead and read screen');
INSERT INTO EquipmentType (ID, Description, model, Instructions) VALUES (12345123451234512348, 'Measures heart rate', 3.9, 'Clamp onto patient finger and read screen');
INSERT INTO Equipment (SerialNum, PurchaseYear, LastInspection, roomNum, TypeID) VALUES ('A01-02X', 2010, '09-SEP-11', 1, 12345123451234512345);
INSERT INTO Equipment (SerialNum, PurchaseYear, LastInspection, roomNum, TypeID) VALUES (2, 2011, '09-SEP-12', 2,12345123451234512345);
INSERT INTO Equipment (SerialNum, PurchaseYear, LastInspection, roomNum, TypeID) VALUES (3, 2012, '09-SEP-13', 3,12345123451234512345);
INSERT INTO Equipment (SerialNum, PurchaseYear, LastInspection, roomNum, TypeID) VALUES (4, 2005, '03-MAR-06', 4, 12345123451234512346);
INSERT INTO Equipment (SerialNum, PurchaseYear, LastInspection, roomNum, TypeID) VALUES (5, 2006, '03-MAR-07', 5, 12345123451234512346);
INSERT INTO Equipment (SerialNum, PurchaseYear, LastInspection, roomNum, TypeID) VALUES (6, 2007, '03-MAR-08', 6, 12345123451234512346);
INSERT INTO Equipment (SerialNum, PurchaseYear, LastInspection, roomNum, TypeID) VALUES (7, 2010, '04-APR-11', 7, 12345123451234512348);
INSERT INTO Equipment (SerialNum, PurchaseYear, LastInspection, roomNum, TypeID) VALUES (8, 2011, '04-APR-12', 8, 12345123451234512348);
INSERT INTO Equipment (SerialNum, PurchaseYear, LastInspection, roomNum, TypeID) VALUES (9, 2012, '04-APR-13', 9, 12345123451234512348);
INSERT INTO Equipment (SerialNum, PurchaseYear, LastInspection, roomNum, TypeID) VALUES (10, 2012, '04-APR-13', 9, 12345123451234512348);
INSERT INTO Admission (Num, AdmissionDate, LeaveDate, TotalPayment, InsurancePayment, FutureVisit, Patient_SSN) VALUES (1, '03-MAR-10', '04-MAR-10', 4, 2, '02-MAR-11', 111-22-3330);
INSERT INTO Admission (Num, AdmissionDate, LeaveDate, TotalPayment, InsurancePayment, FutureVisit, Patient_SSN) VALUES (2, '02-FEB-11', '03-FEB-11', 5, 2, '02-FEB-12', 111-22-3330);
INSERT INTO Admission (Num, AdmissionDate, LeaveDate, TotalPayment, InsurancePayment, FutureVisit, Patient_SSN) VALUES (3, '01-JAN-13', '02-JAN-13', 6, 2, '01-JAN-14', 111-22-3331);
INSERT INTO Admission (Num, AdmissionDate, LeaveDate, TotalPayment, InsurancePayment, FutureVisit, Patient_SSN) VALUES (4, '01-JAN-14', '02-JAN-14', 7, 3, '01-JAN-15', 111-22-3331);
INSERT INTO Admission (Num, AdmissionDate, LeaveDate, TotalPayment, InsurancePayment, FutureVisit, Patient_SSN) VALUES (5, '06-JUN-14', '07-JUN-14', 8, 3, '04-APR-16', 111-22-3332);
INSERT INTO Admission (Num, AdmissionDate, LeaveDate, TotalPayment, InsurancePayment, FutureVisit, Patient_SSN) VALUES (6, '06-JUN-13', '07-JUN-13', 9, 3, '06-JUN-14', 111-22-3332);
INSERT INTO Admission (Num, AdmissionDate, LeaveDate, TotalPayment, InsurancePayment, FutureVisit, Patient_SSN) VALUES (7, '03-MAR-11', '04-MAR-11', 10, 6, '03-MAR-12', 111-22-3333);
INSERT INTO Admission (Num, AdmissionDate, LeaveDate, TotalPayment, InsurancePayment, FutureVisit, Patient_SSN) VALUES (8, '03-MAR-12', '04-MAR-12', 11, 4, '03-MAR-13', 111-22-3333);
INSERT INTO Admission (Num, AdmissionDate, LeaveDate, TotalPayment, InsurancePayment, FutureVisit, Patient_SSN) VALUES (9, '07-JUL-11', '08-JUL-11', 4, 2, '07-JUL-12', 111-22-3334);
INSERT INTO Admission (Num, AdmissionDate, LeaveDate, TotalPayment, InsurancePayment, FutureVisit, Patient_SSN) VALUES (10, '07-JUL-12', '08-JUL-12', 6, 4, '07-JUL-13', 111-22-3334);
INSERT INTO Employee (ID, FName, LName, Salary, jobTitle, OfficeNum, empRank, supervisorID) VALUES (12345123451234512345, 'Cara', 'Seely', 70000, 'Technician', 1, 1, 12345123451234511111);
INSERT INTO Employee (ID, FName, LName, Salary, jobTitle, OfficeNum, empRank, supervisorID) VALUES (12345123451234512346, 'Sam', 'Comeau', 70000, 'Technician', 2, 1, 12345123451234511111);
INSERT INTO Employee (ID, FName, LName, Salary, jobTitle, OfficeNum, empRank, supervisorID) VALUES (12345123451234512347, 'Carl', 'Leely', 60000, 'Technician', 3, 1, 12345123451234511111);
INSERT INTO Employee (ID, FName, LName, Salary, jobTitle, OfficeNum, empRank, supervisorID) VALUES (12345123451234512348, 'San', 'Domeau', 50000, 'Technician', 4, 1, 12345123451234511111);
INSERT INTO Employee (ID, FName, LName, Salary, jobTitle, OfficeNum, empRank, supervisorID) VALUES (12345123451234512349, 'Jeff', 'Laves', 30000, 'Technician', 5, 1, 12345123451234511111);
INSERT INTO Employee (ID, FName, LName, Salary, jobTitle, OfficeNum, empRank, supervisorID) VALUES (12345123451234512340, 'Naomi', 'Loco', 50000, 'Technician', 6, 1, 12345123451234511111);
INSERT INTO Employee (ID, FName, LName, Salary, jobTitle, OfficeNum, empRank, supervisorID) VALUES (12345123451234512341, 'Gabi', 'Sammy', 60000, 'Technician', 7, 1, 12345123451234511112);
INSERT INTO Employee (ID, FName, LName, Salary, jobTitle, OfficeNum, empRank, supervisorID) VALUES (12345123451234512342, 'Jennifer', 'Gi', 40000, 'Technician', 8, 1, 12345123451234511112);
INSERT INTO Employee (ID, FName, LName, Salary, jobTitle, OfficeNum, empRank, supervisorID) VALUES (12345123451234512343, 'Erin', 'Esco', 30000, 'Technician', 9, 1, 12345123451234511112);
INSERT INTO Employee (ID, FName, LName, Salary, jobTitle, OfficeNum, empRank, supervisorID) VALUES (12345123451234512344, 'Rhiannon', 'Godd', 50000, 'Technician', 10, 1, 12345123451234511112);
INSERT INTO Employee (ID, FName, LName, Salary, jobTitle, OfficeNum, empRank, supervisorID) VALUES (12345123451234511111, 'Eric', 'Lo', 60000, 'Div 1 Manager', 11, 10, 12345123451234510000);
INSERT INTO Employee (ID, FName, LName, Salary, jobTitle, OfficeNum, empRank, supervisorID) VALUES (12345123451234511112, 'Danielle', 'Smith', 70000, 'Div 2 Manager', 12, 10, 12345123451234510000);
INSERT INTO Employee (ID, FName, LName, Salary, jobTitle, OfficeNum, empRank, supervisorID) VALUES (12345123451234511113, 'Erika', 'Smith', 70000, 'Div 3 Manager', 13, 10, 12345123451234516666);
INSERT INTO Employee (ID, FName, LName, Salary, jobTitle, OfficeNum, empRank, supervisorID) VALUES (12345123451234511114, 'Dan', 'Barbin', 50000, 'Div 4 Manager', 14, 10, 12345123451234516666);
INSERT INTO Employee (ID, FName, LName, Salary, jobTitle, OfficeNum, empRank) VALUES (12345123451234510000, 'Beyonce', 'Knowles', 100000, 'Gen 1 Manager', 15, 20);
INSERT INTO Employee (ID, FName, LName, Salary, jobTitle, OfficeNum, empRank) VALUES (12345123451234516666, 'Henry', 'Dunphy', 1000000, 'Gen 2 Manager', 16, 20);
INSERT INTO RoomAccess (roomNum, EmpID) VALUES (1, 12345123451234512345);
/* good Q1:This query reports the room numbers that are currently occuppied*/
SELECT Num FROM Room WHERE occupiedFlag = 'T';
/* good Q2:This query reports all employees supervised by a division manager*/
SELECT ID, FName, LName, Salary FROM Employee WHERE empRank = 1;
/* good Q3:This query reports the sum of amounts paid by the insurance company for that patient and their SSN*/
SELECT Patient_SSN, sum(InsurancePayment) as SUM FROM Admission GROUP BY Patient_SSN;
/* good Q4: This query reports the number of visits done for each patient, i.e., for each patient, report the patient SSN, first and last names, and the count of visits done by this patient.*/
SELECT Patient.SSN, Patient.FirstName, Patient.LastName, count(Admission.Num) as CNT FROM Patient, Admission WHERE Admission.Patient_SSN = Patient.SSN GROUP BY SSN, FirstName, LastName;
/* good Q5: This query reports the room number that has an equipment unit with serial number ‘A01-02X’*/
SELECT count(roomNum) FROM Equipment WHERE SerialNum = 'A01-02X';
/* good Q6: This query reports the employee who has access to the largest number of rooms. We need the employee ID, and the number of rooms (s)he can access. Note: If there are several employess with the same maximum number, then report all of these employees.*/
SELECT EmpID, count(roomNum) FROM RoomAccess GROUP BY EmpID HAVING count(roomNum) = (SELECT MAX(Num) FROM (SELECT count(roomNum) as Num FROM RoomAccess GROUP BY EmpID));
/* good Q7: Report the number of regular employees, division managers, and general managers in the hospital. */
SELECT count(empRank) as total FROM Employee GROUP BY empRank;
/* good Q8: This report queries patients who have a scheduled future visit (which is part of their most recent visit), report that patient (SSN, and first and last names) and the visit date. Do not report patients who do not have scheduled visit.*/
SELECT SSN, FirstName, LastName, FutureVisit FROM Patient, Admission WHERE FutureVisit is not null AND Patient.SSN = Admission.Patient_SSN;
/* error Q9 For each equipment type that has more than 3 units, report the equipment type ID, model, and the number of units this type has. */
SELECT EquipmentType.ID, COUNT, EquipmentType.model FROM (SELECT TypeID, count(SerialNum) as COUNT FROM Equipment GROUP BY TypeID), EquipmentType 
WHERE TypeID = EquipmentType.ID AND COUNT >3;
/* error Q10: This query reports the date of the coming future visit for patient with SSN = 111-22-3333*/
SELECT A.FutureVisit FROM (SELECT A.Patient_SSN, MAX(AdmissionDate) as MAX FROM Admission A GROUP BY A.Patient_SSN) D, Admission A WHERE '111-22-3333' = A.Patient_SSN AND D.MAX = A.AdmissionDate;
/* error Q11: The query reports patient with SSN = 111-22-3333, report the doctor’s IDs who have examined this patient more than 2 times.*/
SELECT DoctorID FROM Examine WHERE Examine.AdmissionNum = Admission.Num  Having count(AdmissionNum) > 2 SELECT Num  FROM Admission WHERE Patient_SSN = '111-22-3333';
/* good Q12: The query reports the equipment type iDs for which the hospital has purchased equipments (units) in both 2010 and 2011. Do not report duplication. */
SELECT Distinct TypeID FROM Equipment WHERE PurchaseYear = '2010' OR PurchaseYear = '2011'; 

/* Part 1 */

/* View 1 */ 
CREATE OR REPLACE VIEW CriticalCases AS
	SELECT Patient_SSN, firstName, lastName, count(*) AS numberOfAdmissionsToICU
	FROM Patient P, StayIn S, Admission A, RoomService R
	WHERE P.SSN = A.Patient_SSN AND A.Num = S.AdmissionNum
	AND S.RoomNum = R.roomNum AND R.service = 'ICU'
	GROUP BY Patient_SSN, firstName, lastName
	HAVING count(*) >= 2;


/* View 2 */
CREATE OR REPLACE VIEW DoctorsLoad AS
	(SELECT D.ID AS DoctorID, gender, 'Underloaded' AS LOAD
	FROM Doctor D,Examine E
	WHERE D.ID = E.DoctorID
	GROUP BY ID, gender
	HAVING count(DISTINCT E.AdmissionNum) <= 10)
	UNION
	(SELECT D.ID AS DoctorID, gender, 'Overloaded' AS LOAD
	FROM Doctor D, Examine E
	WHERE D.ID = E.DoctorID
	GROUP BY ID, gender
	HAVING count(DISTINCT E.AdmissionNum) > 10);

/* Select 1 */

SELECT Patient_SSN, firstName, lastName
FROM CriticalCases
WHERE numberOfAdmissionsToICU > 4;

/* Select 2 */
SELECT L.DoctorID, firstName, lastName
FROM Doctor D, DoctorsLoad L
WHERE D.ID = L.DoctorID AND L.LOAD = 'Overloaded' AND D.gender = 'F';

/* Select 3 */ 
SELECT D.DoctorID, A.Patient_SSN, Comments
FROM DoctorsLoad D, CriticalCases C, Examine E, Admission A
WHERE E.AdmissionNum = A.Num AND D.LOAD = 'Underloaded'
AND A.Patient_SSN = C.Patient_SSN AND D.DoctorID = E.DoctorID;

/* Part 2 */

/* Trigger 1 */
CREATE OR REPLACE TRIGGER maxThreeServices
BEFORE INSERT ON RoomService
FOR EACH ROW
DECLARE
	Val integer;
BEGIN
	SELECT COUNT(*) INTO Val
			FROM RoomService
				WHERE roomNum = :new.roomNum;
	IF Val >2 THEN
		RAISE_APPLICATION_ERROR(-2004, 'This room contains the max number of services');
	END IF;
END;
/

/* Trigger 2 */
CREATE OR REPLACE TRIGGER insurancePaymentPercentage
BEFORE INSERT OR UPDATE ON Admission
FOR EACH ROW
BEGIN
	:new.InsurancePayment := (:new.TotalPayment * 0.7);
END;
/

/* Trigger 3 */
CREATE OR REPLACE TRIGGER regEmpAndDivEmp
BEFORE INSERT OR UPDATE ON Employee
FOR EACH ROW
DECLARE
	manCnt INTEGER;
BEGIN
	SELECT COUNT(*) INTO manCnt
		FROM Employee
		WHERE :new.supervisorID = Employee.ID
		AND Employee.empRank = '10';
	IF :new.empRank = '1' THEN
		IF manCnt != 1 THEN
			RAISE_APPLICATION_ERROR(-20004, 'Cannot Insert Record.');
		END IF;
	ELSE
		RETURN;
	END IF;
END;
/
	

/* Trigger 4 */ 
CREATE OR REPLACE TRIGGER divEmpAndGenEmp
BEFORE INSERT OR UPDATE ON Employee
FOR EACH ROW
DECLARE
	manCnt INTEGER;
BEGIN
	SELECT COUNT(*) INTO manCNT
		FROM Employee
		WHERE :new.supervisorID = Employee.ID
		AND Employee.empRank = '20';
	IF :new.empRank = '10' THEN
		IF manCnt != 1 THEN
			RAISE_APPLICATION_ERROR(-20004, 'Cannot Insert Record.');
		END IF;
	ELSE
		RETURN;
	END IF;
END;
/


/* Trigger 5 */
CREATE TRIGGER futureICUDate
BEFORE INSERT ON Admission
FOR EACH ROW
DECLARE
	roomServ INTEGER;
BEGIN
	SELECT COUNT(*) INTO roomServ
	FROM RoomService
	WHERE roomNum = :new.roomNum
	AND service = "ICU";

	IF roomServ != 1 THEN
		RETURN;
	ELSE 
		UPDATE Admission
		SET FutureVisit = ADD_MONTHS(:new.AdmissionDate, 3)
		WHERE :new.Num = Admission.Num;
	END IF;
END;
/

/* Trigger 6 */
CREATE OR REPLACE TRIGGER MRICheck
BEFORE INSERT OR UPDATE ON Equipment
FOR EACH ROW
BEGIN
	IF :new.TypeID != '12345123451234512345' THEN
		RETURN;
	ELSE
		IF :new.PurchaseYear IS NOT NULL AND :new.PurchaseYear > 2005 THEN
			RETURN;
		ELSE
			RAISE_APPLICATION_ERROR(-20004, 'year is not valid');
		END IF;
	END IF;
END;
/

/*Trigger 7*/
CREATE OR REPLACE TRIGGER newPatient
BEFORE INSERT ON Admission
FOR EACH ROW
BEGIN
	FOR t IN (SELECT DoctorID FROM Examine WHERE AdmissionNum IN 
(SELECT Num FROM Admission WHERE :new.Patient_SSN = Admission.Patient_SSN))
	LOOP
		dbms_output.put_line(t.DoctorID);
	END LOOP;
END;
/
