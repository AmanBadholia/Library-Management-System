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
