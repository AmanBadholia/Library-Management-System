/* Develop stored procedures for borrowing a book 

transactions -
	Transaction_ID (Auto Increament)
	UID 
    BID
    Borrow_Date
    Due_Date
    Return_Date
users -
	FirstName
    LastName
    Email
    PhoneNumber */


Delimiter //
create procedure Borrow(IN FN varchar(60), IN LN VARCHAR(60) ,IN EM VARCHAR(60) ,IN PN bigint,IN BT smallint)
BEGIN 
/*IF quantity available is 0 means book can not be borrowed */
	DECLARE DataFound INT;
	Select Quantity_Available into DataFound from Books where Book_ID = BT;
IF DataFound = 0 THEN
	Signal sqlstate '45000'
	SET message_text = 'QUANTITY AVAILABLE FOR THE BOOK IS NULL.';
ELSE 
	IF NOT EXISTS 
    /*If users credentials are already available there is no need to make new 
    but if not then insert new user*/
		(select * from users where FirstName = FN and LastName = LN and Email = EM and PhoneNumber = PN)
		THEN
	/*For new user*/
	INSERT INTO users SET FirstName = FN , LastName = LN , Email = EM , PhoneNumber = PN;
	END IF;

	INSERT INTO transactions SET 
	UID = (select User_ID from Users where FirstName = FN And LastName = Ln),
	BID = BT,
	Borrow_Date = NOW() , Due_Date = date_add(now(), interval 5 day);
END IF;
END //
Delimiter ;

call Borrow("Rocky","Rocks","Rocky@gmail.com",1234567890,144);

/*To check where quantity is 0 in books table*/

select Book_ID,Title from books where Quantity_Available = 0;
Select * from Customer_Details where FullName = "Rocky Rocks";

/*To check where quantity is not 0 in books table*/
select Book_ID,Title from books where Quantity_Available <> 0;
call Borrow("Rocky","Rocks","Rocky@gmail.com",1234567890,11);
Select * from Customer_Details where FullName = "Rocky Rocks";


DROP procedure IF EXISTS Borrow;
