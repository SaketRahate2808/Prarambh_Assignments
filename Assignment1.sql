**********************************************************************LIBRARY MANAGEMENT SYSTEM*************************************************************************

1] List Books with exactly 1 Available Copy .

SELECT Book_ID, Title, Available_Copies 
FROM Books WHERE Available_Copies = 1;

2] List Authors whose Name starts with 'J':

SELECT Author_Name FROM Authors 
WHERE Author_Name LIKE ('J%');

3] List the members with no address recorded.

SELECT Member_Name, Address FROM Members 
WHERE Address IS NULL;

4] List borrowings from a specific borrow date.

SELECT * FROM Borrowings WHERE
Borrow_Date = TO_DATE('2025-10-01', 'YYYY-MM-DD');

5) Select Books with application year after 2000.

SELECT * FROM Books 
WHERE Publication_Year > 2000;


6) List Borrowings with zero fines.

SELECT * FROM Borrowings WHERE Fine = 0;

7) List Members sorted by Membership date in decreasing order.

SELECT Member_Name, Membership_Date FROM Members 
WHERE ORDER BY Membership_Date DESC;


8) Count the total number of Authors.
SELECT COUNT(*) AS Author_Count FROM Authors;


9) List Book Titles containing a specific word 'Potter'.

SELECT * FROM Books WHERE Title LIKE('Potter');

10) List Borrowings returned on Specific date.

  SELECT * from Borrowings WHERE
Return_Date = To_Date('2025-10-14', 'YYYY-MM-DD');


11) List Members with specific area code in their phone number (111);

SELECT Member_Name, Phone FROM Members WHERE
Phone LIKE('111%');


12) List all the books sorted in the order alphabatically based on their titles.
SELECT * FROM Books WHERE ORDER BY Title ASC;


13) Sum of all total available copies across all the books.

SELECT SUM(Available_Copies) AS Total_Available_Copies FROM Books;


14) List Borrowings with a due date within a specific month.

SELECT * FROM Borrowings WHERE
TO_CHAR(Due_Date, 'YYYY-MM-DD') = '2025-10';


15) List Authors with name longer than 10 Characters.

SELECT Author_Name FROM Authors 
WHERE LENGTH(Author_Name) > 10;


**********************************************************************LIBRARY MANAGEMENT SYSTEM*************************************************************************

-- DDL Operations (Creating Tables with Constraints)

-- Create Authors table
CREATE TABLE Authors (
    Author_ID NUMBER PRIMARY KEY,
    Author_Name VARCHAR2(100) NOT NULL
);

-- Create Books table
CREATE TABLE Books (
    Book_ID NUMBER PRIMARY KEY,
    Title VARCHAR2(200) NOT NULL,
    Author_ID NUMBER NOT NULL,
    ISBN VARCHAR2(13) UNIQUE NOT NULL,
    Publication_Year NUMBER(4) CHECK (Publication_Year > 1900),
    Available_Copies NUMBER CHECK (Available_Copies >= 0),
    CONSTRAINT fk_author FOREIGN KEY (Author_ID) REFERENCES Authors(Author_ID) ON DELETE CASCADE
);

-- Create Members table
CREATE TABLE Members (
    Member_ID NUMBER PRIMARY KEY,
    Member_Name VARCHAR2(100) NOT NULL,
    Address VARCHAR2(200),
    Phone VARCHAR2(15) UNIQUE,
    Membership_Date DATE DEFAULT SYSDATE
);

-- Create Borrowings table
CREATE TABLE Borrowings (
    Borrowing_ID NUMBER PRIMARY KEY,
    Book_ID NUMBER NOT NULL,
    Member_ID NUMBER NOT NULL,
    Borrow_Date DATE DEFAULT SYSDATE,
    Due_Date DATE NOT NULL,
    Return_Date DATE,
    Fine NUMBER(10,2) DEFAULT 0 CHECK (Fine >= 0),
    CONSTRAINT check_date CHECK (Due_Date>Borrow_Date),
    CONSTRAINT fk_book FOREIGN KEY (Book_ID) REFERENCES Books(Book_ID) ON DELETE CASCADE,
    CONSTRAINT fk_member FOREIGN KEY (Member_ID) REFERENCES Members(Member_ID) ON DELETE CASCADE
);

-- DML Operations (Insert, Update, Delete)

-- INSERT examples
INSERT INTO Authors (Author_ID, Author_Name) VALUES (1, 'J.K. Rowling');
INSERT INTO Authors (Author_ID, Author_Name) VALUES (2, 'J.R.R. Tolkien');

INSERT INTO Books (Book_ID, Title, Author_ID, ISBN, Publication_Year, Available_Copies)
VALUES (1, 'Harry Potter and the Sorcerer''s Stone', 1, '9780747532743', 1997, 5);
INSERT INTO Books (Book_ID, Title, Author_ID, ISBN, Publication_Year, Available_Copies)
VALUES (2, 'The Hobbit', 2, '9780261103344', 1937, 3);
INSERT INTO Books (Book_ID, Title, Author_ID, ISBN, Publication_Year, Available_Copies)
VALUES (3, 'The Hobby', 3, '9780261103214', 2010, 1);

INSERT INTO Members (Member_ID, Member_Name, Address, Phone)
VALUES (1, 'John Doe', '123 Main St, City', '123-456-7890');
INSERT INTO Members (Member_ID, Member_Name, Address, Phone)
VALUES (2, 'Jane Smith', '456 Elm St, Town', '987-654-3210');

INSERT INTO Borrowings (Borrowing_ID, Book_ID, Member_ID, Due_Date)
VALUES (1, 1, 1, SYSDATE + 14);

 
