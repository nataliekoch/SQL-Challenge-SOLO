//Which authors are represented in our store?:
"Ariel";"Denham"
"John";"Worsley"
"Paulette";"Bourgeois"
"Margery Williams";"Bianco"
"Louisa May";"Alcott"
"Stephen";"King"
"Frank";"Herbert"
"Burne";"Hogarth"
"Margaret Wise";"Brown"
"Edgar Allen";"Poe"
"Mark";"Lutz"
"Tom";"Christiansen"
"Richard";"Brautigan"
"Poppy Z.";"Brite"
"Edward";"Gorey"
"Arthur C.";"Clarke"
"Andrew";"Brookins"
"Neil";"Simon"
"Theodor Seuss";"Geisel"

SELECT * FROM authors;

//Which authors are also distinguished authors?
"Neil";"Simon"
"Theodor Seuss";"Geisel"

SELECT * FROM distinguished_authors

//Which authors are not distinguished authors?
"Ariel";"Denham"
"John";"Worsley"
"Paulette";"Bourgeois"
"Margery Williams";"Bianco"
"Louisa May";"Alcott"
"Stephen";"King"
"Frank";"Herbert"
"Burne";"Hogarth"
"Margaret Wise";"Brown"
"Edgar Allen";"Poe"
"Mark";"Lutz"
"Tom";"Christiansen"
"Richard";"Brautigan"
"Poppy Z.";"Brite"
"Edward";"Gorey"
"Arthur C.";"Clarke"
"Andrew";"Brookins"

SELECT G1.first_name, G1.last_name, G2.first_name, G2.last_name
FROM authors G1
INNER JOIN distinguished_authors G2
ON G1.last_name = G2.last_name

//How many authors are represented in our store?
19

SELECT COUNT(id) FROM authors

//Who are the favorite authors of the employee with the first name of Michael?
J.R.R. Tolkien, Charles Dickens, Ariel Denham

SELECT authors_and_titles FROM favorite_authors

//What are the titles of all the books that are in stock today?
SELECT stock.*, editions.*, books.* FROM stock JOIN editions ON editions.isbn = stock.isbn JOIN books ON books.id = editions.book_id WHERE stock.stock > 0

//Insert one of your favorite books into the database. Hint: You’ll want to create data in at least 2 other tables to completely create this book.
INSERT INTO books (id, title, author_id, subject_id)
VALUES(27, 'Harry Potter and the Chamber of Secrets', 0927, 847);
INSERT INTO stock (isbn, cost, retail, stock)
VALUES(46562482743974, 10.00, 40.00, 100);

What authors have books that are not in stock?
SELECT stock.*, editions.*, books.*, authors.*
FROM stock JOIN editions ON editions.isbn = stock.isbn
JOIN books ON books.id = editions.book_id
JOIN authors ON authors.id = books.author_id
WHERE stock.stock = 0

What is the title of the book that has the most stock?
SELECT title
FROM books INNER JOIN editions ON books.id = editions.book_id WHERE isbn IN
(SELECT isbn FROM stock WHERE stock = (SELECT MAX(stock) FROM stock));
