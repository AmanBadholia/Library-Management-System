# Library-Management-System
This project is a comprehensive Library Management System (LMS) built using MYSQL as the backend database.

# PROJECT OVERVIEW-
 
 The Purpose and Goals of the Project -
1. **Efficient Resource Management:** To effectively manage and track the library's collection, including cataloging, classification, and inventory management.

2. **User Accessibility:** To provide easy access to library resources through features like search functionality.

3. **Automation of Processes:** To automate routine tasks such as issuing and returning items, generating reports.

4. **Analytics and Reporting:** To provide insights into library usage patterns, circulation trends, and resource popularity through data analytics and reporting capabilities.

# This LMS system is needed for Library management for the cases:
 1. Reduce costs associated with staffing, materials tracking, maintenance.
 2. Allow for materials metadata reporting.
 3. Trend analysis
 4. Enhanced reputational benefits for both management and staff

# DATA SOURCES-

1. **User Accounts Datasource (Synthetic data):**
   - **Description:** User account information is sourced from CSV files sourced through website "https://generatedata.com/generator".
   - **Data Format:** The data is stored in comma-separated values (CSV) files, with each file representing users ,Transactions, Books. Fields include user_ID, name, email, PhoneNmuber.
   - **Challenges:** Generating synthetic data that closely matches the characteristics of real data for a particlar use case
    requires customization which is done through PANDAS library.
![image](https://github.com/AmanBadholia/Library-Management-System/assets/159482577/3ad393c6-c476-445d-8302-dafcb24aba28)

2. **External Data Sources (CSV files):**
   - **Description:** Additional metadata and external data sources, such as book summaries are sourced through website "https://www.kaggle.com/datasets/drahulsingh/best-selling-books/data)".
   - **Data Format:** Fields include book title, author, synopsis, ISBN, and URL.
  
3. **Transactions Accounts Datasource (Synthetic data):**
   - **Description:** User account information is sourced from CSV files sourced through website "https://generatedata.com/generator".
   - **Data Format:** The data is stored in comma-separated values (CSV) files, with each file representing users ,Transactions, Books. Fields include user_ID, name, email, PhoneNmuber.
   - **Challenges:** Integrating user account data from multiple CSV files posed challenges in data synchronization and it requires customization which is done through PANDAS library..
![image](https://github.com/AmanBadholia/Library-Management-System/assets/159482577/a07db20b-c4f9-413b-8a48-a082c287c4eb)

# Data Model:
1. **ENTITIES**
- **BOOKS:** Represents the book in a library.
   - **Attributes:** 
   - **BOOK_ID** 
   - **TITLE**
   - **Author**
   - **Genre**
   - **Publication_Year**
   - **ISBN**
   - **Quantity_Available**

- **USERS:** Represents a library member.
   - **Attributes:** 
   - **USER_ID** 
   - **FirstName**
   - **LastName**
   - **Email**
   - **PhoneNumber**

- **TRANSACTIONS:** .
   - **Attributes:** 
   - **Transaction_ID** 
   - **USER_ID**
   - **BOOK_ID**
   - **Borrow_Date**
   - **Due_Date**
   - **Return_Date**

2. **RELATIONSHIPS**
- **TRANSACTION-BOOK:** Many-to-one relationship between transactions and books. Each transaction is associated with one book, but a book can be into multiple transactions.
- **TRANSACTION-USER:** Many-to-one relationship between transactions and users. Each transaction is associated with one user, but a user can have multiple transactions.

3. **CONSTRAINTS**
-  Each BOOK must have a unique BOOK_ID.
-  Each USER must have a unique USER_ID.
-  Each TRANSACTION must have a unique TRANSACTION_ID.
-  Foreign key constraints ensure referential integrity between related tables (e.g., BID in Transactions table refernces BOOK_ID in Books table).

3. **DIAGRAM**

   ![image](https://github.com/AmanBadholia/Library-Management-System/assets/159482577/8b018a6f-545f-454f-8f43-311212f3b4d4)

# DATABASE MANAGEMENT:
 1. **SCHEMA**

- MYSQL Queries for creating database - [Download Library_DB.sql](Library_DB.sql)
  
![image](https://github.com/AmanBadholia/Library-Management-System/assets/159482577/24b68817-0be4-4520-b36d-f43d2c855abf)  
![image](https://github.com/AmanBadholia/Library-Management-System/assets/159482577/4ec1a83d-fe3c-4e38-bfce-f086700445c7)  
![image](https://github.com/AmanBadholia/Library-Management-System/assets/159482577/e97b6e66-bac5-4bef-bef8-9d8e2b444a1e)

# TESTING:
OUTLINING DIFFERENT SCENARIOS TESTED DURING THE PROJECT.

**1. Queries:**
- MYSQL Queries for testing -[Download Library_Queries.sql](Library_Queries.sql)
- Retrieve a list of all books available in the library.
- Find out who has borrowed a specific book.
- List all overdue books.
- Display the history of transactions for a particular user.
- Calculate the total number of books borrowed by a user.

**2. Relationships:**
- MYSQL Queries for making Relationship while creating database - [Download Library_DB.sql](Library_DB.sql)
- Establish relationships between the tables (e.g., Books and Transactions through BookID).
- Ensure referential integrity by setting up appropriate constraints.

**3. Indexing:**
- MYSQL Queries for Indexing - [Download Library_DB.sql](Library_DB.sql)
- Index important columns for faster retrieval, like BookID, UserID, etc.

**4. Views:**
- MYSQL Queries for Views - [Download Library_View.sql](Library_View.sql)
- Create views to simplify complex queries or frequently used combinations of data.

**5. Procedures/Functions:**

- Develop stored procedures for common tasks (e.g., borrowing a book, returning a book).

**6. Triggers:**

- Implement triggers for automatic updates (e.g., decrease QuantityAvailable when a book is borrowed).
