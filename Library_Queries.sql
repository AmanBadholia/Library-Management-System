use librarydb;

#Query1  Retrieve a list of all books available in the library

select distinct title as "List of all books available" from books where Quantity_Available is not null;

#Query2  Find out who has borrowed a specific book

select B.Title,concat(U.FirstName," ", U.LastName) as "Borrower" , count(FirstName) as NumberOfBorrowing from 
transactions as Tr 
 inner join users as U on Tr.UID = U.User_ID
 inner join books as B on Tr.BID = B.Book_ID
where B.Title = (select Title from books limit 1 offset 34) 
group by Borrower, B.Title
order by Borrower asc;

#Query3 List all overdue books 

select * from transactions;

/*First for overdue Return_Date must contain some null values,
 so we are deleting some according to the last borrow_date 
*/
#Assuming Last borrow date is current date
select borrow_Date from transactions  order by borrow_date desc limit 1;

set @variable_date = (select borrow_Date from transactions  order by borrow_date desc limit 1);

update transactions set Return_Date = NULL
Where Return_Date >  @variable_date and Transaction_ID > 1;

select * from transactions;

/*List all overdue books on 2023-01-31 08:37:00*/

select B.Title,concat(U.FirstName," ", U.LastName) as "Borrower" , Tr.Due_Date from 
transactions as Tr 
 inner join users as U on Tr.UID = U.User_ID
 inner join books as B on Tr.BID = B.Book_ID
 where Tr.Return_Date is null;

#Query4 Display the History of transactions for a particular user

select Tr.Transaction_ID, B.Title, Tr.Borrow_Date, Tr.Return_Date from
transactions as Tr 
 inner join users as U on Tr.UID = U.User_ID
 inner join books as B on Tr.BID = B.Book_ID
where U.FirstName =  (select FirstName from users limit 1 offset 3)
AND U.LastName =  (select LastName from users limit 1 offset 3)
group by Tr.Transaction_ID,B.Title
order by Tr.Transaction_ID asc;

#Query5 Calculate the total number of books borrowed by a User.

select concat(U.FirstName," ", U.LastName) as "Borrower", count(B.Title) from
transactions as Tr 
 inner join users as U on Tr.UID = U.User_ID
 inner join books as B on Tr.BID = B.Book_ID
where U.FirstName =  (select FirstName from users limit 1 offset 3) 
AND U.LastName =  (select LastName from users limit 1 offset 3)
group by Borrower;