# -------------------------------------------------------------
# SQL Script to Create Three TimeClockDB Tables
# -------------------------------------------------------------
 
DROP TABLE IF EXISTS Hours;
DROP TABLE IF EXISTS Employee;
DROP TABLE IF EXISTS Supervisor;


/* The Supervisor table*/
CREATE TABLE Supervisor
(
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
	email VARCHAR (128) NOT NULL,
    password VARCHAR (32) NOT NULL, 
    first_name VARCHAR (32) NOT NULL,
    middle_name VARCHAR (32),
    last_name VARCHAR (32) NOT NULL,
    PRIMARY KEY (id)
);


/* The Employee table*/
CREATE TABLE Employee
(
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
	email VARCHAR (128) NOT NULL,
    password VARCHAR (32) NOT NULL,
    first_name VARCHAR (32) NOT NULL,
    middle_name VARCHAR (32),
    last_name VARCHAR (32) NOT NULL,
    supervisor_id INT UNSIGNED,
    FOREIGN KEY (supervisor_id) REFERENCES Supervisor(id),
    PRIMARY KEY (id)
);


/* The Hours table*/
CREATE TABLE Hours
(
       id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT NOT NULL,
       entry_datetime DATETIME NOT NULL, /*MMDDYYYYHHmm*/
	   duration TIME NOT NULL, /*HHmm*/
	   description VARCHAR (256) NOT NULL,
	   approval TINYINT UNSIGNED NOT NULL, /*0=pending, 1=approved, 2=rejected*/
	   employee_id INT UNSIGNED,
	   FOREIGN KEY (employee_id) REFERENCES Employee(id) ON DELETE CASCADE
);

INSERT INTO Supervisor (email, password, first_name, middle_name, last_name) VALUES
('TyeAlbescu@vt.edu', 'TyeAlbescu', 'Tye', 'Ivano', 'Albescu'),
('HeberGreenberg@vt.edu', 'HeberGreenberg', 'Heber', 'Adriaan', 'Greenberg'),
('LugosColumbo@vt.edu', 'LugosColumbo', 'Lugos', 'Ambrosios', 'Columbo');

INSERT INTO Employee (email, password, first_name, middle_name, last_name, supervisor_id) VALUES
('CamronPatterson@vt.edu', 'CamronPatterson', 'Camron', 'Valen', 'Patterson', (SELECT id from Supervisor WHERE email='TyeAlbescu@vt.edu')),
('BrantWatson@vt.edu', 'BrantWatson', 'Brant', 'Junior', 'Watson', (SELECT id from Supervisor WHERE email='TyeAlbescu@vt.edu')),
('VernPark@vt.edu', 'VernPark', 'Vern', 'Braeden', 'Park', (SELECT id from Supervisor WHERE email='TyeAlbescu@vt.edu')),
('VereQuincy@vt.edu', 'VereQuincy', 'Vere', 'Carlyle', 'Quincy', (SELECT id from Supervisor WHERE email='HeberGreenberg@vt.edu')),
('AdolphFrank@vt.edu', 'AdolphFrank', 'Adolph', 'Abe', 'Frank', (SELECT id from Supervisor WHERE email='HeberGreenberg@vt.edu'));

INSERT INTO Hours (entry_datetime, duration, description, approval, employee_id) VALUES
('2016-09-01 12:30:10', '01:25:59', 'graded all papers for assignment 3', '0', (SELECT id from Employee WHERE email='CamronPatterson@vt.edu')),
('2016-09-10 12:25:45', '02:10:33', 'graded all code for project 1', '0', (SELECT id from Employee WHERE email='CamronPatterson@vt.edu')),
('2016-09-12 9:15:22', '03:10:10', 'office hours for test 1 prep', '1', (SELECT id from Employee WHERE email='CamronPatterson@vt.edu')),
('2016-09-22 3:41:55', '04:33:59', 'graded all code for project 2', '2', (SELECT id from Employee WHERE email='CamronPatterson@vt.edu')),
('2016-10-05 1:39:13', '05:01:11', 'graded all code for project 3', '0', (SELECT id from Employee WHERE email='CamronPatterson@vt.edu')),
('2016-08-30 8:30:15', '06:01:59', 'completed step 1 of research project', '1', (SELECT id from Employee WHERE email='BrantWatson@vt.edu')),
('2016-09-01 6:22:54', '05:45:23', 'completed second step of semester project', '1', (SELECT id from Employee WHERE email='BrantWatson@vt.edu')),
('2016-09-5 9:50:44', '07:11:30', 'debugged first phase of the project', '1', (SELECT id from Employee WHERE email='BrantWatson@vt.edu')),
('2016-09-10 7:30:40', '05:10:43', 'completed presentation slides for next week demo', '1', (SELECT id from Employee WHERE email='BrantWatson@vt.edu')),
('2016-09-22 11:00:10', '09:55:10', 'finished project proposal', '1', (SELECT id from Employee WHERE email='BrantWatson@vt.edu')),
('2016-10-01 12:01:33', '04:49:39', 'debugged second phase of project', '1', (SELECT id from Employee WHERE email='BrantWatson@vt.edu')),
('2016-10-11 07:55:10', '09:10:22', 'completed phase 3 of the project', '1', (SELECT id from Employee WHERE email='BrantWatson@vt.edu')),
('2016-09-02 15:30:15', '02:45:10', 'office hours session 1', '0', (SELECT id from Employee WHERE email='VernPark@vt.edu')),
('2016-09-09 15:29:43', '02:22:10', 'office hours session 2', '0', (SELECT id from Employee WHERE email='VernPark@vt.edu')),
('2016-09-16 15:35:30', '02:40:54', 'office hours session 3', '0', (SELECT id from Employee WHERE email='VernPark@vt.edu')),
('2016-09-23 15:29:22', '02:30:12', 'office hours session 4', '0', (SELECT id from Employee WHERE email='VernPark@vt.edu')),
('2016-09-30 15:30:15', '02:29:30', 'office hours session 5', '0', (SELECT id from Employee WHERE email='VernPark@vt.edu')),
('2016-10-07 15:21:44', '02:10:10', 'office hours session 6', '0', (SELECT id from Employee WHERE email='VernPark@vt.edu')),
('2016-10-14 15:39:29', '02:40:12', 'office hours session 7', '0', (SELECT id from Employee WHERE email='VernPark@vt.edu')),
('2016-10-21 15:31:00', '02:55:59', 'office hours session 8', '0', (SELECT id from Employee WHERE email='VernPark@vt.edu')),
('2016-10-28 15:10:23', '02:14:16', 'office hours session 9', '0', (SELECT id from Employee WHERE email='VernPark@vt.edu'));






