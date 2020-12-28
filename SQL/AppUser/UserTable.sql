USE HospitalDB1
GO

/*--------------------------
	Manager
--------------------------*/
CREATE TABLE UserManager(
	Usn VARCHAR(15) PRIMARY KEY,
	Pwd VARCHAR(30) NOT NULL,
	ID NCHAR(9) FOREIGN KEY REFERENCES BQL(MaNV)
)
GO

INSERT INTO UserManager
VALUES
	('mng', '0', '000000000');

/*--------------------------
	Doctor
--------------------------*/

CREATE TABLE UserDoctor(
	Usn VARCHAR(15) PRIMARY KEY,
	Pwd VARCHAR(30) NOT NULL,
	ID NCHAR(9) FOREIGN KEY REFERENCES BacSi(MaNV)
)
GO

INSERT INTO UserDoctor
VALUES
	('c1', 'c1', '100000001'),
	('c2', 'c2', '100000002'),
	('c3', 'c3', '100000003'),
	('c4', 'c4', '100000004'),
	('c5', 'c5', '100000005'),
	('c6', 'c6', '100000006'),
	('c7', 'c7', '100000007'),

	('x1', 'x1', '100000011'),
	('x2', 'x2', '100000012'),
	('x3', 'x3', '100000013'),
	('x4', 'x4', '100000014'),
	('x5', 'x5', '100000015'),
	('x6', 'x6', '100000016'),
	('x7', 'x7', '100000017'),

	('p1', 'p1', '100000021'),
	('p2', 'p2', '100000022'),
	('p3', 'p3', '100000023'),
	('p4', 'p4', '100000024'),
	('p5', 'p5', '100000025'),
	('p6', 'p6', '100000026'),
	('p7', 'p7', '100000027');

/*--------------------------
	Patient
--------------------------*/
CREATE TABLE UserPatient(
	Usn VARCHAR(15) PRIMARY KEY,
	Pwd VARCHAR(30) NOT NULL,
	ID NCHAR(9) FOREIGN KEY REFERENCES BenhNhan(CMND)
)
GO

INSERT INTO UserPatient
VALUES
	('i1', 'i1', '225600001'),
	('i2', 'i2', '225600002'),
	('i3', 'i3', '225600003'),
	('i4', 'i4', '225600004'),
	('i5', 'i5', '225600005'),


	('o1', 'o1', '225600011'),
	('o2', 'o2', '225600012'),
	('o3', 'o3', '225600013'),
	('o4', 'o4', '225600014'),
	('o5', 'o5', '225600015');


