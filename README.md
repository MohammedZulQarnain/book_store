# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version ruby 2.7 and Rails version 6

* System dependencies 
- Ruby installed 
- Bundler gem install
- PostgreSql (make sure db server is running by running)

* Configuration
Run `bundle install` to install the required packages
Run the Following Commands to setup the DB:
  `rake db:create` - To Create the database
  `rake db:migrate` - To migrate the schema and related details
  `rake db:seed` - To seed sample data
Run `rails s` to start the server then Navigate to localhost:3000 to check if server is running

Guide for endpoints:
base url: http://localhost:3000/api/v1
* /books - GET endpoint to get the list of all the books
* /books - POST endpoint to create a new Book 
* /books/{bookId} - PUT To Update the details about that particular book
* /books/{bookId} - GET To get the details about that particular book
* /books/{bookId} - DELETE To Delete a book

* /sorted-books-publisher - GET endpoint to get the list of all books after sorting by Publisher, Author (last, first), then title
* /sorted-books-author - GET endpoint to get the list of all books after sorting by Author (last, first), then title
* /total-price-books - GET endpoint to get the total price of all books
* /mla-citation-format - GET endpoint to get MLA (Modern Language Association) style citation of all the books.
* /cms-citation-format - GET endpoint to get Chicago style citation (Chicago Manual of Style) of all the books.