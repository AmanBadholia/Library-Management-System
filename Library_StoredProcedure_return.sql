/* Develop stored procedures for returning a book 
transactions -
	UID 
    BID
    Return_Date */
    
/*To check Transaction_ID on behalf of UserName and bookid*/

Select TR.Transaction_ID from transactions as Tr 
 inner join users as U on Tr.UID = U.User_ID
 inner join books as B on Tr.BID = B.Book_ID 
 where U.FirstName = "Preston" And U.LastName = "Sparks" and B.BOOK_ID = 164 
 ORDER BY Tr.Transaction_ID DESC Limit 1;

Delimiter //
create procedure BookReturn(IN FN varchar(60), IN LN VARCHAR(60),IN BT smallint)
BEGIN 
Declare TID INT;
/*To show transaction number*/
	Select TR.Transaction_ID into TID from transactions as Tr 
 inner join users as U on Tr.UID = U.User_ID
 inner join books as B on Tr.BID = B.Book_ID 
 where U.FirstName = FN And U.LastName = Ln and B.BOOK_ID = BT 
 ORDER BY Tr.Transaction_ID DESC Limit 1;
 
 Select TID;
 /*Updating Returned Date*/
 IF 
	(select Return_Date from transactions where Transaction_ID = TID order by Transaction_id Desc limit 1) is null
 THEN
	UPDATE transactions SET 
	UID = (select User_ID from Users where FirstName = FN And LastName = Ln),
	BID = BT, Return_Date = now() where Transaction_ID = TID;
 ELSE
	Signal sqlstate '45000'
	SET message_text = 'Already Returned.';
 END IF;
END //
Delimiter ;

call BookReturn("Preston","Sparks",164);

DROP procedure IF EXISTS BookReturn;
Select * from transactions where transaction_ID = 11611;
Select * from Customer_Details where transaction_ID = 11611;
Select * from Customer_Details where return_Date is null;