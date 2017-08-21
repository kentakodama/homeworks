require 'byebug'

class BooksController < ApplicationController
  def index
    # index means by default get all of the objects associated with that model.
    #in this case index will display all books
    @books = Book.all
  end

  def new
    # your code here
    render 'books/new' #when render, it always tries to access the views directory, dont have to write the .html.erb
    #render is forgiving with the path, but redirecting requires more info
  end

  def create
    # your code here
    book = Book.new(book_params) #white listing in private method below, if it 'passes' the conditions set in the white listing then stores in book var
    if book.save #if saveable
      redirect_to books_url
    else 
      render json: book.errors.full_messages
    end
  end

  def destroy
    # your code here
    # debugger
    book = Book.find params[:id]
    #debugger
    book.delete
    redirect_to books_url #this books_url is index of books controller
    #redirect_to 'http://localhost:3000/books'
  end

  private
  def book_params
    params.require(:book).permit(:title, :author)
  end
end
