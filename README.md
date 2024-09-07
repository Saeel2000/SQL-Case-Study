# SQL-Case-Study
Case Study: Library Management System
In this case study, you will work with a database schema designed for managing a library. The schema 
consists of six tables: Books, Members, Loans, Authors, BookAuthors, and Fines. Your task is to create 
these tables, insert records, and perform various SQL queries to manage and analyze library 
operations, member activities, book loans, and fines.
Database Schema

1. Books
o BookID (INT, Primary Key)
o Title (VARCHAR)
o Author (VARCHAR)
o PublicationYear (YEAR)
o Genre (VARCHAR)

3. Members
o MemberID (INT, Primary Key)
o FirstName (VARCHAR)
o LastName (VARCHAR)
o Email (VARCHAR)
o MembershipDate (DATE)

5. Loans
o LoanID (INT, Primary Key)
o BookID (INT, Foreign Key referencing Books.BookID)
o MemberID (INT, Foreign Key referencing Members.MemberID)
o LoanDate (DATE)
o ReturnDate (DATE)

7. Authors
o AuthorID (INT, Primary Key)
o AuthorName (VARCHAR)
o BirthYear (YEAR)

9. BookAuthors
o BookID (INT, Foreign Key referencing Books.BookID)
o AuthorID (INT, Foreign Key referencing Authors.AuthorID)

11. Fines
o FineID (INT, Primary Key)
o LoanID (INT, Foreign Key referencing Loans.LoanID)
o FineAmount (DECIMAL)
o PaidDate (DATE)


Questions:
1. Create Table:
o Write an SQL statement to create all tables with the specified columns.

2. Insert Records:
o Insert at least 10 records in all the tables.

3. Select Records:
o Write a query to select all books published before 2000 from the Books table.

4. Where Clause (AND/OR):
o Write a query to select all Loans where the LoanDate is in 2024 and the ReturnDate 
is NULL.

5. LIKE Operator:
o Write a query to select all Books where the Title contains 'Science'.

7. CASE Statement:
o Write a query to select Title and a new column Availability from the Books table. If a 
book has been loaned out (i.e., exists in Loans table with a NULL ReturnDate), set 
Availability to 'Checked Out', otherwise 'Available'.

9. Subquery:
o Write a query to find all Members who have borrowed more than 5 books. Use a 
subquery to find these MemberIDs.

10. Group By:
o Write a query to get the total number of books borrowed by each Member. Group 
the results by MemberID.

11. Having Clause:
o Write a query to get the total FineAmount collected for each LoanID, but only 
include loans where the total fine amount is greater than $10. Use the HAVING 
clause.

12. Limit:
o Write a query to select the top 5 most frequently borrowed books.

14. Inner Join:
o Write a query to join Loans with Books to get a list of all loans with Title, LoanDate, 
and ReturnDate.

16. Outer Join:
o Write a query to get a list of all Books and any associated loans. Include books that 
might not be currently borrowed.

[Case Study - Library Management System.pdf](https://github.com/user-attachments/files/16918369/Case.Study.-.Library.Management.System.pdf)
