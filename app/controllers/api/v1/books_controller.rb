class Api::V1::BooksController < ApplicationController

  # index renders all books in the books table
  def index
    books = Book.all
    render json: books, status: 200
  end

  # As the name implies this method lets us create a new book.
  # If the book saves correctly, we render the json data for the book.
  # If the book doesnot save correctly we render an error object.
  def create
    book = Book.new(
      publisher: book_params[:publisher],
      title: book_params[:title],
      author_last_name: book_params[:author_last_name],
      author_first_name: book_params[:author_first_name],
      price: book_params[:price]
    )
    if book.save
      render json: book, status: 201
    else
      render json: {error: "Error creating book."}
    end
  end

  # This method looks up a book by the id, if it is found we render the json object.
  # Otherwise we render an error object.
  def show
    book = retrieve_book
    if book
      render json: book, status: 200
    else
      render json: {error: "Book not found."}
    end
  end

  # This method looks up a book by the id, if it is found delete it.
  # Otherwise we render an error object.
  def destroy
    if retrieve_book
      retrieve_book.destroy!
      head :no_content
    else 
      render json: {error: "Book cannot be deleted as its not found."}
    end
  end

  # This method looks up a book by the id, if it is found update it.
  # Otherwise we render an error object.
  def update
    book_params.require(%i[publisher title author_last_name author_first_name price])
    if retrieve_book
      retrieve_book.update(
        publisher: book_params[:publisher],
        title: book_params[:title],
        author_last_name: book_params[:author_last_name],
        author_first_name: book_params[:author_first_name],
        price: book_params[:price]
      )
      head :no_content
    else 
      render json: {error: "Book cannot be updated as its not found."}
    end
  end

  private
    # Private: Retrieve book for requested book by it's id.
    def retrieve_book
      Book.find_by(id: params[:id])
    end

    def book_params
      params.require(:book).permit([
        :publisher,
        :title,
        :author_last_name,
        :author_first_name,
        :price
      ])
    end
end
