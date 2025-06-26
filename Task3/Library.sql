CREATE DATABASE LIBRARY;
USE LIBRARY;

CREATE TABLE Author (
    author_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL
);

INSERT INTO Author (name) VALUES 
('J.K. Rowling'),
('George Orwell'),
('Harper Lee'),
('Dan Brown'),
('Agatha Christie');
select * from author;
DELETE FROM Author;
ALTER TABLE Author AUTO_INCREMENT = 1;
INSERT INTO Author (name) VALUES 
('J.K. Rowling'),
('George Orwell'),
('Harper Lee'),
('Dan Brown'),
('Agatha Christie');

Insert into author(name)values('sahana');








CREATE TABLE Book (
    book_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    author_id INT,
    FOREIGN KEY (author_id) REFERENCES Author(author_id)
);
INSERT INTO Book (title, author_id) VALUES 
('Harry Potter and the Sorcerer''s Stone', 1),
('1984', 2),
('To Kill a Mockingbird', 3),
('The Da Vinci Code', 4),
('Unknown Title', NULL);  -- No author assigned

Update book set author_id=5 where title='unknown title';

select * from book;
delete from book;
alter table book auto_increment=1;
INSERT INTO Book (title, author_id) VALUES 
('Harry Potter and the Sorcerer''s Stone', 1),
('1984', 2),
('To Kill a Mockingbird', 3),
('The Da Vinci Code', 4),
('Unknown Title', NULL);  -- No author assigned




CREATE TABLE Member (
    member_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    join_date DATE
);
INSERT INTO Member (name, join_date) VALUES
('Alice Johnson', '2023-05-10'),
('Bob Smith', NULL),                  
('Charlie Davis', '2024-01-15'),
('Diana Prince', NULL),               
('Ethan Hunt', '2024-06-01');
select * from member;

update member set join_date='2024-05-13' where name='bob smith';



CREATE TABLE Loan (
    loan_id INT PRIMARY KEY AUTO_INCREMENT,
    book_id INT,
    member_id INT,
    loan_date DATE,
    return_date DATE,
    FOREIGN KEY (book_id) REFERENCES Book(book_id),
    FOREIGN KEY (member_id) REFERENCES Member(member_id)
);
INSERT INTO Loan (book_id, member_id, loan_date, return_date) VALUES
(1, 1, '2024-06-10', NULL),
(2, 2, '2024-06-11', '2024-06-15'),
(3, 3, '2024-06-12', NULL),
(4, 4, '2024-06-13', '2024-06-18'),
(5, 5, '2024-06-14', NULL);

SELECT * FROM loan;

-- Task 3: Basic SELECT Queries for Library Database

-- 1. Select all members
SELECT * FROM Member;

-- 2. Select names of books and their corresponding author IDs
SELECT title, author_id FROM Book;

-- 3. Find books where author is not assigned
SELECT title FROM Book WHERE author_id IS NULL;

-- 4. Select all members who joined after 2024-01-01
SELECT name, join_date FROM Member
WHERE join_date > '2024-05-01';

-- 5. Get members whose name starts with 'A'
SELECT * FROM Member WHERE name LIKE 'A%';

-- 6. Get members who joined between '2024-01-01' and '2024-06-30'
SELECT * FROM Member
WHERE join_date BETWEEN '2024-04-01' AND '2024-06-30';

-- 7. Show the 3 most recent loans
SELECT * FROM Loan
ORDER BY loan_date DESC
LIMIT 3;

-- 8. List books in alphabetical order
SELECT * FROM Book
ORDER BY title ASC;






