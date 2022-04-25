1.	Create a REST API using RoR MVC and write a method to return a sorted list of these by Publisher, Author (last, first), then title.
- Sol: Please refer to end point  http://localhost:3000/api/v1/sorted-books-publisher

2.	Write another API method to return a sorted list by Author (last, first) then title.
- Sol: Please refer to end point  http://localhost:3000/api/v1/sorted-books-author

3.	If you had to create one or more tables to store the Book data in a PostGre database, outline the table design along with fields and their datatypes.
- Sol: Please refer below


  ![DB Design](/solution/book.jpg)

4.	Write stored procedures for steps 1 and 2, and use them in separate API methods to return the same results.
- Sol: Stored procedure created for 
    Run `rails c`
    create procedures as follows and Run `CALL sort_book_publisher` 
    1. `CREATE OR REPLACE PROCEDURE public.sort_book_publisher()
        LANGUAGE sql
        AS $procedure$
        SELECT * FROM books ORDER BY publisher, author_last_name, author_first_name, title
        $procedure$`

    2. `CREATE OR REPLACE PROCEDURE public.sort_book_author()
        LANGUAGE sql
        AS $procedure$
        SELECT * FROM books ORDER BY author_last_name, author_first_name, title
        $procedure$`

5.	Write an API method to return the total price of all books in the database.
- Sol: Please refer to end point  http://localhost:3000/api/v1/total-price-books

6.	If you have a large list of these in memory and want to save the entire list to the database, with only one call to the DB server.
- Sol: Make use of Copy command provided turn-off any triggers  indexes and foreign keys before loading the data and adding them back afterwards if required.
  - Syntax:
      `COPY table_name [ ( column_name [, ...] ) ]
          FROM { 'filename' | PROGRAM 'command' | STDIN }
          [ [ WITH ] ( option [, ...] ) ]
          [ WHERE condition ]`

7.	Add a property to the Book class that outputs the MLA (Modern Language Association) style citation as a string (https://images.app.goo.gl/YkFgbSGiPmie9GgWA). Please add whatever additional properties the Book class needs to generate the citation.
- Sol: Please refer to end point  http://localhost:3000/api/v1/mla-citation-format

8.	Add another property to generate a Chicago style citation (Chicago Manual of Style) (https://images.app.goo.gl/w3SRpg2ZFsXewdAj7).
- Sol: Please refer to end point  http://localhost:3000/api/v1/cms-citation-format
