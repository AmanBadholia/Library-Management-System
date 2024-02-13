# Indexing important column for fast retrieval from all tables
/* By creating an index we are going to improve the efficiency of queries
that filter data based on the column selected, making them faster and more optimized.*/ 

#1  Creating index on books, users, transactions table(s)-
create index UID on users (User_ID);
create index TID on transactions (Transaction_ID);
create index BID on books (Book_ID);

create index PhoneNumber on users (Phonenumber);
create index Borrow_Date on transactions (Borrow_Date);
create index Title on books (Title);

#2  Retrieving data using the index-
select * from users where User_ID = '115';
select * from transactions where Transaction_ID = '11205';
select * from books where Book_ID = '25';

select * from users where PhoneNumber = '9576853194';
select * from transactions where Borrow_Date = '2023-01-01 17:50:00';
select * from books where Title = 'She: A History of Adventure';

#3  Viewing index usage
Explain select * from users where User_ID = '115';
Explain select * from transactions where Transaction_ID = '11205';
Explain select * from books where Book_ID = '25';

Explain select * from users where PhoneNumber = '9576853194';
Explain select * from transactions where Borrow_Date = '2023-01-01 17:50:00';
Explain select * from books where Title = 'She: A History of Adventure';