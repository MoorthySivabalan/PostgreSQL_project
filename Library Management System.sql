-- Authors table
CREATE TABLE Authors (
    author_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    birthdate DATE
);

-- Books table
CREATE TABLE Books (
    book_id SERIAL PRIMARY KEY,
    title VARCHAR(200) NOT NULL,
    author_id INT NOT NULL REFERENCES Authors(author_id),
    genre VARCHAR(50) NOT NULL,
    publication_year INT NOT NULL
);

-- Borrowers table
CREATE TABLE Borrowers (
    borrower_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone_number VARCHAR(15) UNIQUE NOT NULL
);

-- Create Staff table
CREATE TABLE Staff (
    staff_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    role VARCHAR(50) NOT NULL
);

-- Borrowing_Records table
CREATE TABLE Borrowing_Records (
    record_id SERIAL PRIMARY KEY,
    borrower_id INT NOT NULL REFERENCES Borrowers(borrower_id),
    book_id INT NOT NULL REFERENCES Books(book_id),
    borrow_date DATE NOT NULL,
    return_date DATE
);

-- Library_Branches table
CREATE TABLE Library_Branches (
    branch_id SERIAL PRIMARY KEY,
    branch_name VARCHAR(100) NOT NULL,
    address VARCHAR(200) NOT NULL
);

-- Book_Copies table
CREATE TABLE Book_Copies (
    copy_id SERIAL PRIMARY KEY,
    book_id INT NOT NULL REFERENCES Books(book_id),
    branch_id INT NOT NULL REFERENCES Library_Branches(branch_id),
    availability_status BOOLEAN NOT NULL
);

-- Genres table
CREATE TABLE Genres (
    genre_id SERIAL PRIMARY KEY,
    genre_name VARCHAR(50) NOT NULL
);

-- Publisher table
CREATE TABLE Publisher (
    publisher_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    address VARCHAR(200)
);

-- Book_Publishers table
CREATE TABLE Book_Publishers (
    id SERIAL PRIMARY KEY,
    book_id INT NOT NULL REFERENCES Books(book_id),
    publisher_id INT NOT NULL REFERENCES Publisher(publisher_id)
);

-- Insert sample data for Authors
INSERT INTO Authors (name, birthdate) VALUES
('J.K. Rowling', '1965-07-31'),
('George R.R. Martin', '1948-09-20'),
('J.R.R. Tolkien', '1892-01-03'),
('Agatha Christie', '1890-09-15'),
('Stephen King', '1947-09-21'),
('Jane Austen', '1775-12-16'),
('Mark Twain', '1835-11-30'),
('Ernest Hemingway', '1899-07-21'),
('Charles Dickens', '1812-02-07'),
('Isaac Asimov', '1920-01-02');

-- Insert sample data for Books
INSERT INTO Books (title, author_id, genre, publication_year) VALUES
('Harry Potter and the Sorcerer''s Stone', 1, 'Fantasy', 1997),
('A Game of Thrones', 2, 'Fantasy', 1996),
('The Hobbit', 3, 'Fantasy', 1937),
('Murder on the Orient Express', 4, 'Mystery', 1934),
('The Shining', 5, 'Horror', 1977),
('Pride and Prejudice', 6, 'Romance', 1813),
('Adventures of Huckleberry Finn', 7, 'Adventure', 1884),
('The Old Man and the Sea', 8, 'Fiction', 1952),
('A Tale of Two Cities', 9, 'Historical', 1859),
('Foundation', 10, 'Science Fiction', 1951);

-- Insert sample data for Borrowers
INSERT INTO Borrowers (name, email, phone_number) VALUES
('Alice Johnson', 'alice.johnson@example.com', '1234567890'),
('Bob Smith', 'bob.smith@example.com', '1234567891'),
('Charlie Brown', 'charlie.brown@example.com', '1234567892'),
('Daisy Miller', 'daisy.miller@example.com', '1234567893'),
('Edward Norton', 'edward.norton@example.com', '1234567894'),
('Fiona Adams', 'fiona.adams@example.com', '1234567895'),
('George Harrison', 'george.harrison@example.com', '1234567896'),
('Hannah Lee', 'hannah.lee@example.com', '1234567897'),
('Ian Curtis', 'ian.curtis@example.com', '1234567898'),
('Jessica Taylor', 'jessica.taylor@example.com', '1234567899');

-- Insert sample data for Staff
INSERT INTO Staff (name, email, role) VALUES
('Anna Scott', 'anna.scott@example.com', 'Librarian'),
('Brian Davis', 'brian.davis@example.com', 'Assistant Librarian'),
('Clara Evans', 'clara.evans@example.com', 'Manager'),
('David Wilson', 'david.wilson@example.com', 'Technician'),
('Eleanor White', 'eleanor.white@example.com', 'Clerk'),
('Frank Green', 'frank.green@example.com', 'Security'),
('Grace Hill', 'grace.hill@example.com', 'Janitor'),
('Henry Carter', 'henry.carter@example.com', 'Archivist'),
('Isla Morgan', 'isla.morgan@example.com', 'Receptionist'),
('Jack Baker', 'jack.baker@example.com', 'Administrator');

-- Insert sample data for Borrowing_Records
INSERT INTO Borrowing_Records (borrower_id, book_id, borrow_date, return_date) VALUES
(1, 1, '2023-01-01', '2023-01-15'),
(2, 2, '2023-01-03', '2023-01-18'),
(3, 3, '2023-01-05', '2023-01-20'),
(4, 4, '2023-01-07', '2023-01-22'),
(5, 5, '2023-01-09', '2023-01-24'),
(6, 6, '2023-01-11', '2023-01-26'),
(7, 7, '2023-01-13', '2023-01-28'),
(8, 8, '2023-01-15', '2023-01-30'),
(9, 9, '2023-01-17', '2023-02-01'),
(10, 10, '2023-01-19', '2023-02-03');

-- Insert sample data for Library_Branches
INSERT INTO Library_Branches (branch_name, address) VALUES
('Central Library', '123 Main St'),
('East Side Library', '456 East St'),
('West End Library', '789 West St'),
('North Branch Library', '101 North St'),
('South Branch Library', '202 South St'),
('Downtown Library', '303 Downtown St'),
('Uptown Library', '404 Uptown St'),
('Suburban Library', '505 Suburban St'),
('Riverside Library', '606 Riverside St'),
('Hilltop Library', '707 Hilltop St');

-- Insert sample data for Book_Copies
INSERT INTO Book_Copies (book_id, branch_id, availability_status) VALUES
(1, 1, TRUE),
(2, 2, TRUE),
(3, 3, TRUE),
(4, 4, FALSE),
(5, 5, TRUE),
(6, 6, TRUE),
(7, 7, TRUE),
(8, 8, FALSE),
(9, 9, TRUE),
(10, 10, TRUE);

-- Insert sample data for Genres
INSERT INTO Genres (genre_name) VALUES
('Fantasy'),
('Mystery'),
('Horror'),
('Romance'),
('Adventure'),
('Fiction'),
('Historical'),
('Science Fiction'),
('Thriller'),
('Biography');

-- Insert sample data for Publisher
INSERT INTO Publisher (name, address) VALUES
('Penguin Random House', '1745 Broadway, New York, NY'),
('HarperCollins', '195 Broadway, New York, NY'),
('Simon & Schuster', '1230 Avenue of the Americas, New York, NY'),
('Macmillan', '120 Broadway, New York, NY'),
('Hachette Book Group', '1290 Avenue of the Americas, New York, NY'),
('Scholastic', '557 Broadway, New York, NY'),
('Bloomsbury', '50 Bedford Square, London'),
('Tor Books', '120 West 45th Street, New York, NY'),
('Oxford University Press', 'Great Clarendon Street, Oxford'),
('Cambridge University Press', 'University Printing House, Cambridge');

-- Insert sample data for Book_Publishers
INSERT INTO Book_Publishers (book_id, publisher_id) VALUES
(1, 6),
(2, 1),
(3, 7),
(4, 1),
(5, 3),
(6, 9),
(7, 10),
(8, 4),
(9, 8),
(10, 2);


-- List all books along with their authors
SELECT b.title AS Book_Title, a.name AS Author_Name FROM Books b JOIN Authors a 
ON b.author_id = a.author_id;

-- Find all books that were published after 1950
SELECT title, publication_year FROM Books WHERE publication_year > 1950;

-- Counting the total number of books available in each branch
SELECT lb.branch_name, COUNT(bc.copy_id) AS Total_Books FROM Library_Branches lb
JOIN Book_Copies bc ON lb.branch_id = bc.branch_id GROUP BY lb.branch_name;

--List of borrowers who borrowed books
SELECT br.name AS Borrower_Name, bk.title AS Book_Title, brc.borrow_date FROM Borrowing_Records brc
JOIN Borrowers br ON brc.borrower_id = br.borrower_id JOIN Books bk ON brc.book_id = bk.book_id;

-- Find the most borrowed book
SELECT b.title, COUNT(br.record_id) AS Borrow_Count FROM Borrowing_Records br
JOIN Books b ON br.book_id = b.book_id GROUP BY b.title ORDER BY Borrow_Count DESC LIMIT 1;

-- Retrieve the details of unavailable book copies
SELECT bc.copy_id, b.title, lb.branch_name FROM Book_Copies bc JOIN Books b ON bc.book_id = b.book_id
JOIN Library_Branches lb ON bc.branch_id = lb.branch_id WHERE bc.availability_status = FALSE;

-- List all books published by "Scholastic
SELECT b.title FROM Books b JOIN Book_Publishers bp ON b.book_id = bp.book_id
JOIN Publisher p ON bp.publisher_id = p.publisher_id WHERE p.name = 'Scholastic';

-- Retrieve the contact details of borrowers who borrowed fantasy books
SELECT br.name, br.email, br.phone_number FROM Borrowers br JOIN Borrowing_Records brc 
ON br.borrower_id = brc.borrower_id JOIN Books b ON brc.book_id = b.book_id 
WHERE b.genre = 'Fantasy';

-- Find the oldest book in the database
SELECT title, publication_year FROM Books ORDER BY publication_year ASC LIMIT 1;

-- List staff members working in managerial roles
SELECT name, email FROM Staff WHERE role LIKE '%Manager%';

-- Find all books borrowed between two specific dates
SELECT b.title, brc.borrow_date, brc.return_date FROM Borrowing_Records brc JOIN Books b 
ON brc.book_id = b.book_id WHERE brc.borrow_date BETWEEN '2023-01-01' AND '2023-01-10';

-- Retrieve books that belong to multiple genres
SELECT b.title, g.genre_name FROM Books b JOIN Genres g ON b.genre = g.genre_name;

-- List the top 3 most frequently borrowed genres
SELECT b.genre, COUNT(br.record_id) AS Borrow_Count FROM Borrowing_Records br
JOIN Books b ON br.book_id = b.book_id GROUP BY b.genre ORDER BY Borrow_Count DESC LIMIT 3;

-- Retrieve books and their availability status by branch
SELECT b.title, lb.branch_name, bc.availability_status FROM Book_Copies bc JOIN Books b 
ON bc.book_id = b.book_id JOIN Library_Branches lb ON bc.branch_id = lb.branch_id;

-- Find books authored by J.K. Rowling.
SELECT b.title FROM Books b JOIN Authors a ON b.author_id = a.author_id WHERE a.name = 'J.K. Rowling';

-- List borrowers who have not returned their books yet
SELECT br.name, b.title, brc.borrow_date FROM Borrowing_Records brc JOIN Borrowers br 
ON brc.borrower_id = br.borrower_id JOIN Books b ON brc.book_id = b.book_id
WHERE brc.return_date IS NULL;

-- Count the total number of unique genres
SELECT COUNT(DISTINCT genre) AS Total_Genres FROM Books;

-- Retrieve all authors who have written books in the "Science Fiction" genre
SELECT a.name FROM Authors a JOIN Books b ON a.author_id = b.author_id
WHERE b.genre = 'Science Fiction';

-- Find borrowers who borrowed books from the Central Library
SELECT br.name, b.title FROM Borrowing_Records brc JOIN Borrowers br ON brc.borrower_id = br.borrower_id
JOIN Books b ON brc.book_id = b.book_id JOIN Book_Copies bc ON brc.book_id = bc.book_id
JOIN Library_Branches lb ON bc.branch_id = lb.branch_id WHERE lb.branch_name = 'Central Library';
