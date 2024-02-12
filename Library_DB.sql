create database LibraryDB;
use LibraryDB;
Show databases;

create table Books 
( Book_ID int auto_increment primary key ,
Title varchar(200) not null ,
Author varchar(64) not null,
Genre varchar(200) not null,
ISBN int unsigned not null,
Published_Year smallint not null,
Quantity_Available int unsigned not null);
Desc Books;

create table Users 
( User_ID smallint auto_increment primary key ,
FirstName varchar(64) not null ,
LastName varchar(64) not null,
Email varchar(64) not null,
PhoneNumber bigint not null);

Desc Users;

create table Transactions
( Transaction_ID smallint auto_increment primary key ,
UID smallint not null,
Foreign key(UID) references Users(User_ID),
BID int not null,
Foreign key(BID) references Books(Book_ID),
Borrow_Date datetime not null,
Due_Date datetime not null,
Return_Date datetime not null);

Desc Transactions;
