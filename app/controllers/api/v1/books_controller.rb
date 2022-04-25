class Api::V1::BooksController < ApplicationController 
  #method to return total price of all the books.
  def total_price_of_all_books
    books = Book.all
    total_price = books.map(&:price).sum
    render json: total_price, status: 200
  end

  # method to return a sorted list of books by Author (last, first), then title.
  def sorted_books_author
    books = Book.all
    books = books.sort_by { |b| [b.author_last_name.downcase, b.author_first_name.downcase, b.title.downcase]}
    render json: books, status: 200
  end

  # MLA Citation Format - author_last_name,author_first_name.'sub_title' title publisher,publication_date,pp. no_of_pages.
  # method to return books information in MLA (Modern Language Association) style citation
  def mla_citation_format
    books = Book.all
    i = 0
    mla_citation = []
    while ( i < books.length)
      mla_str = books[i][:author_last_name] + "," + books[i][:author_first_name]+"."+ %Q['#{books[0][:sub_title]}']+" " + books[i][:title] +" " + books[i][:publisher] + ","+books[i][:publication_date]&.strftime("%Y")+","+"pp. "+books[i][:no_of_pages].to_s+"."
      mla_citation = mla_citation.append(mla_str)
      i+=1
    end
    render json: mla_citation, status: 200
  end

  # CMS Citation Format - author_last_name,author_first_name. publication_date. 'title' sub_title publisher, no. volume_no (publication_date): no_of_pages. url.
  # method to return books information in Chicago style citation (Chicago Manual of Style) 
  def cms_citation_format
    books = Book.all
    i = 0
    cms_citation = []
    while ( i < books.length)
      cms_str = books[i][:author_last_name] + "," + books[i][:author_first_name]+". "+books[i][:publication_date]&.strftime("%Y")+". "+ %Q['#{books[0][:title]}']+" "+books[i][:sub_title]+" "+ books[i][:publisher]+", "+"no. "+books[i][:volume_no].to_s+" "+"\("+books[i][:publication_date]&.strftime("%B %Y")+"\): "+books[i][:no_of_pages].to_s+". "+ books[i][:url]+"."
      cms_citation = cms_citation.append(cms_str)
      i+=1
    end
    render json: cms_citation, status: 200
  end

  # method to return a sorted list of books by Publisher, Author (last, first), then title.
  def sorted_books_publisher
    books = Book.all
    books = books.sort_by { |b| [b.publisher.downcase, b.author_last_name.downcase, b.author_first_name.downcase, b.title.downcase]}
    render json: books, status: 200
  end

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
      price: book_params[:price],
      sub_title: book_params[:sub_title],
      publication_date: book_params[:publication_date],
      no_of_pages: book_params[:no_of_pages],
      volume_no: book_params[:volume_no],
      url: book_params[:url]
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
    book_params.require(%i[publisher title author_last_name author_first_name price sub_title publication_date no_of_pages volume_no url])
    if retrieve_book
      retrieve_book.update(
        publisher: book_params[:publisher],
        title: book_params[:title],
        author_last_name: book_params[:author_last_name],
        author_first_name: book_params[:author_first_name],
        price: book_params[:price],
        sub_title: book_params[:sub_title],
        publication_date: book_params[:publication_date],
        no_of_pages: book_params[:no_of_pages],
        volume_no: book_params[:volume_no],
        url: book_params[:url]
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
        :price,
        :sub_title,
        :publication_date,
        :no_of_pages,
        :volume_no,
        :url
      ])
    end
end
