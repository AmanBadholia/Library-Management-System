/*Create a trigger to update Quantity_Available whenever there is a return of book*/
Delimiter //

CREATE TRIGGER UPDATE_QUANTITY_B
AFTER INSERT 
ON transactions for EACH ROW
BEGIN
    DECLARE Book_Quantity INT;
    
    select Quantity_Available into book_Quantity
    from books
    where Book_ID = new.BID;
	
	Update books
    set Quantity_available = Book_Quantity - 1
    where Book_ID = NEW.BID;

END //

Drop trigger IF EXISTS UPDATE_QUANTITY_B;
