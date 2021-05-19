create database hospital;
use hospital;
CREATE TABLE doctor (
  employeeid INTEGER PRIMARY KEY NOT NULL auto_increment,
  name varchar(20) NOT NULL,
  designation char(15) NOT NULL,
  departmentid char(3) NOT NULL
); 
describe doctor;

CREATE TABLE department (
  departmentid char(3) PRIMARY KEY NOT NULL,
  name varchar(50) NOT NULL,
  hod INTEGER NOT NULL,
  doctors INTEGER NOT NULL default 1
);

describe department;

CREATE TABLE treatment (
  treatmentid char(3) PRIMARY KEY NOT NULL,
  name varchar(50) NOT NULL,
  cost decimal(10,2) NOT NULL default 0.00,
  deptid char(3) NOT NULL ,
  patients integer not null default 0
);
describe treatment;

CREATE TABLE patient (
  patientid INTEGER PRIMARY KEY NOT NULL auto_increment,
  name varchar(30) NOT NULL,
  address varchar(50) NOT NULL,
  phone integer NOT NULL,
  age INTEGER NOT NULL,
  gender char(1) NOT NULL,
  room integer ,
  doctorid INTEGER NOT NULL ,
  treatmentid char(3)
);

CREATE TABLE room (
  number INTEGER PRIMARY KEY NOT NULL auto_increment,
  type varchar(20) NOT NULL,
  floor integer NOT NULL,
  available  boolean NOT NULL default true
);

CREATE TABLE appointment (
  appointmentid INTEGER PRIMARY KEY NOT NULL auto_increment,
  patientid INTEGER NOT NULL,
  physicianid INTEGER NOT NULL,
  time TIME NOT NULL,
  date date NOT NULL
);


alter table department
add foreign key (hod) references doctor(employeeid);

alter table treatment
add foreign key (deptid) references department(departmentid);

alter table patient
add foreign key (doctorid) references doctor(employeeid);
alter table patient
add foreign key (room) references room(number);
alter table patient
add foreign key (treatmentid) references treatment(treatmentid);

alter table appointment
add foreign key (physicianid) references doctor(employeeid),
add foreign key (patientid) references patient(patientid);

INSERT INTO doctor VALUES(101,'Harshit Agrawal','Surgeon','D02');
INSERT INTO doctor VALUES(null,'Pranav Nair','Physician','D01');
INSERT INTO doctor VALUES(null,'Jinesh Jain','Surgeon','D03');

INSERT INTO department VALUES('D01','Neurology',102,5);
INSERT INTO department VALUES('D02','Cardiology',101,3);
INSERT INTO department VALUES('D03','Psychiatry',103,4);

INSERT INTO treatment VALUES(1,'by pass surgery',150000.00,'D02',3);
INSERT INTO treatment VALUES(2,'Electromyography',375000.00,'D01',5);
INSERT INTO treatment VALUES(3,'electroconvulsion',45000.00,'D03',10);

INSERT INTO patient VALUES(100000001,'Naveen Mall','Gorakhpur','998899889',65,'M',2,101,1);
INSERT INTO patient VALUES(100000002,'Manav Jain','Mumbai','998899880',45,'M',3,102,2);
INSERT INTO patient VALUES(100000003,'Ashish Kumar','Giridih','998899881',46,'M',6,102,2);
INSERT INTO patient VALUES(100000004,'Sachni Kumari','Varanasi','998898892',15,'F',null,103,3);
INSERT INTO patient VALUES(100000005,'Kanishk Gahlot','Rampur','998899893',41,'M',5,102,2);
INSERT INTO patient VALUES(100000006,'Samyak Jain','Indore','998899884',77,'M',null,103,3);
INSERT INTO patient VALUES(100000007,'Kartik Rai','Jalandhar','998898895',69,'M',null,102,2);
INSERT INTO patient VALUES(100000008,'Naman Garg','Kota','998899896',20,'M',1,101,1);

INSERT INTO room VALUES(1,'Single',1,0);
INSERT INTO room VALUES(2,'Single',1,0);
INSERT INTO room VALUES(3,'Double',1,0);
INSERT INTO room VALUES(4,'Single',2,1);
INSERT INTO room VALUES(5,'double',2,0);
INSERT INTO room VALUES(6,'Single',2,0);
INSERT INTO room VALUES(7,'Single',3,1);
INSERT INTO room VALUES(8,'Double',3,1);
INSERT INTO room VALUES(9,'Single',3,1);
INSERT INTO room VALUES(10,'Single',4,1);
INSERT INTO room VALUES(11,'Double',4,1);
INSERT INTO room VALUES(12,'general',4,1);

INSERT INTO appointment VALUES(13216584,100000004,103,'10:00','2008-04-24');
INSERT INTO appointment VALUES(26548913,100000006,103,'11:00','2008-04-24');
INSERT INTO appointment VALUES(36549879,100000007,102,'12:00','2008-04-25');

SET SQL_SAFE_UPDATES = 1;

select * from doctor;
select * from department;
select * from treatment;
select * from patient;
select * from room;
select * from appointment;

describe doctor;
describe department;
describe treatment;
describe patient;
describe room;
describe appointment;