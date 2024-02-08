create database LibraryDB;
use LibraryDB;

create table Books 
( Book_ID smallint primary key ,
Title varchar(64) not null ,
Author varchar(64) not null,
Genre varchar(64) not null,
ISBN int not null,
Published_Year year not null,
Quantity_Available int not null);
Desc Books;

create table Users 
( User_ID smallint primary key ,
FirstName varchar(64) not null ,
LastName varchar(64) not null,
Email varchar(64) not null,
PhoneNumber int not null);

Desc Users;

create table Transactions
( Transaction_ID smallint primary key ,
User_ID smallint,
Foreign key(User_ID) references Users(User_ID),
Book_ID smallint,
Foreign key(Book_ID) references Books(Book_ID),
Borrow_Date datetime not null,
Return_Date datetime not null);

Desc Transactions;