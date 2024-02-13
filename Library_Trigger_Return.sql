/*Create a trigger to update Quantity_Available whenever there is a return of book*/
Delimiter //

CREATE TRIGGER UPDATE_QUANTITY_R
AFTER update
ON transactions for EACH ROW
BEGIN
    DECLARE Book_Quantity INT;
    
    select Quantity_Available into book_Quantity
    from books
    where Book_ID = new.BID;
    
    IF OLD.Return_Date is null then
    Update books
    set Quantity_available = Book_Quantity + 1
    where Book_ID = NEW.BID;
END IF;
END //

Drop trigger IF EXISTS UPDATE_QUANTITY_R;

