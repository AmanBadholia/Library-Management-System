/* Create a View that displays the following informations:
 TransactionID
 FirstName & LastName (Full Name)
 Email
 PhoneNumber
 Book_ID
 Title
 Author
 Borrow_Date
 Return_Date
 Due_Date*/
use LibraryDB;

create view Customer_Details as 
 select distinct Tr.Transaction_ID ,concat(U.FirstName , " " , U.LastName) as FullName , U.Email ,  U.PhoneNumber , 
 B.Book_ID , B.Title , B.Author , Tr.Borrow_Date , Tr.Due_Date , Tr.Return_Date from 
 transactions as Tr 
 inner join users as U on Tr.UID = U.User_ID
 inner join books as B on Tr.BID = B.Book_ID;
 
 Drop view Customer_Details;
 
 Select * from Customer_Details order by FullName;