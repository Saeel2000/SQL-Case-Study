#Case Study: Library Management System
#In this case study, you will work with a database schema designed for managing a library. 
#The schema consists of six tables: Books, Members, Loans, Authors, BookAuthors, and Fines. 
#Your task is to create these tables, insert records, and perform various SQL queries to manage and analyze library operations, member activities, book loans, and fines.
#Database Schema

Create database Case_Study;
use Case_study;

#. Create Table: Write an SQL statement to create all tables with the specified columns.
CREATE TABLE Books (
    BookID INT PRIMARY KEY,
    Title VARCHAR(50),
    Author VARCHAR(20),
    PublicationYear YEAR,
    Genre VARCHAR(20)
);

CREATE TABLE Members (
    MemberID INT PRIMARY KEY,
    FirstName VARCHAR(20),
    LastName VARCHAR(20),
    Email VARCHAR(30),
    MembershipDate DATE
);

CREATE TABLE Loans (
    LoanID INT PRIMARY KEY,
    BookID INT,
    MemberID INT,
    LoanDate DATE,
    ReturnDate DATE,
    FOREIGN KEY (BookID)
        REFERENCES Books (BookID),
    FOREIGN KEY (MemberID)
        REFERENCES Members (MemberID)
);

CREATE TABLE Authors (
    AuthorID INT PRIMARY KEY,
    AuthorName VARCHAR(50),
    BirthYear YEAR
);

CREATE TABLE BookAuthors (
    BookID INT,
    AuthorID INT,
    FOREIGN KEY (BookID)
        REFERENCES Books (BookID),
    FOREIGN KEY (AuthorID)
        REFERENCES Authors (AuthorID)
);

CREATE TABLE Fines (
    FineID INT PRIMARY KEY,
    LoanID INT,
    FineAmount DEC(10 , 2 ),
    PaidDate DATE,
    FOREIGN KEY (LoanID)
        REFERENCES Loans (LoanID)
);

#2. Insert Records:Insert at least 10 records in all the tables.

INSERT INTO Books (BookID, Title, Author, PublicationYear, Genre) VALUES
(1, 'A Brief History of Time', 'Stephen Hawking', 1988, 'Science'),
(2, 'The Selfish Gene', 'Richard Dawkins', 1976, 'Science'),
(3, 'The Catcher in the Rye', 'J.D. Salinger', 1951, 'Fiction'),
(4, '1984', 'George Orwell', 1949, 'Dystopian'),
(5, 'To Kill a Mockingbird', 'Harper Lee', 1960, 'Fiction'),
(6, 'Sapiens', 'Yuval Noah Harari', 2011, 'History'),
(7, 'Cosmos', 'Carl Sagan', 1980, 'Science'),
(8, 'Brave New World', 'Aldous Huxley', 1932, 'Dystopian'),
(9, 'The Great Gatsby', 'F. Scott Fitzgerald', 1925, 'Fiction'),
(10, 'The Origin of Species', 'Charles Darwin', 1959, 'Science');

INSERT INTO Members (MemberID, FirstName, LastName, Email, MembershipDate) VALUES
(11, 'John', 'Doe', 'john@example.com', '2022-01-15'),
(12, 'Jane', 'Smith', 'jane@example.com', '2021-07-20'),
(13, 'Emily', 'Clark', 'emily@example.com', '2023-05-10'),
(14, 'Michael', 'Brown', 'michael@example.com', '2020-11-01'),
(15, 'Sarah', 'Jones', 'sarah@example.com', '2021-03-22'),
(16, 'David', 'Miller', 'david@example.com', '2020-06-18'),
(17, 'Emma', 'Wilson', 'emma@example.com', '2019-08-14'),
(18, 'Daniel', 'Taylor', 'daniel@example.com', '2023-09-05'),
(19, 'Sophia', 'Moore', 'sophia@example.com', '2022-02-28'),
(20, 'Liam', 'Anderson', 'liam@example.com', '2021-12-11');


INSERT INTO Loans (LoanID, BookID, MemberID, LoanDate, ReturnDate) VALUES
(100, 1, 11, '2024-01-10', NULL),
(200, 2, 12, '2023-12-20', '2024-01-05'),
(300, 3, 13, '2024-02-15', NULL),
(400, 4, 14, '2023-11-22', '2023-12-10'),
(500, 5, 15, '2024-01-12', NULL),
(600, 6, 16, '2024-02-01', NULL),
(700, 7, 17, '2024-01-25', '2024-02-10'),
(800, 8, 18, '2024-02-18', NULL),
(900, 9, 19, '2024-03-01', '2024-03-15'),
(1000, 10, 20, '2024-03-20', NULL);

INSERT INTO Authors (AuthorID, AuthorName, BirthYear) VALUES
(101, 'Stephen Hawking', 1942),
(201, 'Richard Dawkins', 1941),
(301, 'J.D. Salinger', 1919),
(401, 'George Orwell', 1903),
(501, 'Harper Lee', 1926),
(601, 'Yuval Noah Harari', 1976),
(701, 'Carl Sagan', 1934),
(801, 'Aldous Huxley', 1994),
(901, 'F. Scott Fitzgerald', 1996),
(1001, 'Charles Darwin', 1909);

INSERT INTO BookAuthors (BookID, AuthorID) VALUES
(1, 101),
(2, 201),
(3, 301),
(4, 401),
(5, 501),
(6, 601),
(7, 701),
(8, 801),
(9, 901),
(10, 1001);

INSERT INTO Fines (FineID, LoanID, FineAmount, PaidDate) VALUES
(111, 200, 15.50, '2024-01-07'),
(222, 400, 5.00, '2023-12-15'),
(333, 500, 12.00, '2024-02-05'),
(444, 700, 10.00, '2024-02-12'),
(555, 300, 8.50, '2024-03-01'),
(666, 600, 20.00, '2024-02-25'),
(777, 900, 4.00, '2024-03-20'),
(888, 800, 6.75, '2024-03-05'),
(999, 1000, 25.00, '2024-04-01'),
(1010, 100, 9.25, '2024-02-15');

#3. Select Records:Write a query to select all books published before 2000 from the Books table.
select * from books where publicationyear <2000;

#4. Where Clause (AND/OR):Write a query to select all Loans where the LoanDate is in 2024 and the ReturnDate is NULL.
select * from loans where year(loandate)=2024 and returndate is null;

#5. LIKE Operator:Write a query to select all Books where the Title contains 'Science'.
select * from books where title like "%Science%";

#6. CASE Statement:Write a query to select Title and a new column Availability from the Books table.
#If a book has been loaned out (i.e., exists in Loans table with a NULL ReturnDate), set Availability to 'Checked Out', otherwise 'Available'.
SELECT Title,
    CASE
        WHEN ReturnDate IS NULL THEN 'Checked Out'
        ELSE 'Available'
    END Availability
FROM books LEFT JOIN loans USING (BookID);

#7. Subquery:Write a query to find all Members who have borrowed more than 5 books. Use a subquery to find these MemberIDs.
SELECT memberId, Firstname, lastname FROM members
WHERE memberid IN (SELECT memberid
        FROM loans
        GROUP BY memberID
        HAVING COUNT(loanId) > 5);

#8. Group By:Write a query to get the total number of books borrowed by each Member. Group the results by MemberID.
SELECT memberID, COUNT(LoanID) TotalBooksBorrowed
FROM loans
GROUP BY memberID;

#9. Having Clause:Write a query to get the total FineAmount collected for each LoanID, 
#but only include loans where the total fine amount is greater than $10. Use the HAVING clause.
SELECT LoanID, SUM(FineAmount) Total_Fine
FROM fines
GROUP BY loanID
HAVING Total_Fine > 10;

#10. Limit:Write a query to select the top 5 most frequently borrowed books.
SELECT 
    Title, BookID, COUNT(BookID) BorrowCount
FROM loans
        JOIN books USING (Bookid)
GROUP BY bookid
ORDER BY BorrowCount DESC
LIMIT 5;

#11. Inner Join:Write a query to join Loans with Books to get a list of all loans with Title, LoanDate,and ReturnDate.
SELECT Title, LoanDate, ReturnDate
FROM books
        JOIN loans USING (BookID);

#12. Outer Join:Write a query to get a list of all Books and any associated loans. Include books that might not be currently borrowed.
SELECT Title, LoanDate, ReturnDate
FROM books
        LEFT JOIN loans USING (BookID);

































