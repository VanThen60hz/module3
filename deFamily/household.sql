drop database if exists householdManagement;
create database householdManagement;
use householdManagement;
create table household(
	id varchar(50) not null primary key,
    name varchar(50),
    quantity int,
    dateOfRegistration varchar(50),
    address varchar(50)
);
