class BooksController < ApplicationController
  def top
  end

  def new
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    book.update(book_params)
    flash[:notice] = "Book was successfully updated."
    redirect_to book_path(book.id)
  end

  def destroy
     book = Book.find(params[:id])
     book.destroy
     redirect_to books_path
    end

  def create
      book = Book.new(book_params)
      book.save
      flash[:notice] = "Book was successfully updated."
      redirect_to book_path(book.id)
  end

  def index
  	  @books = Book.all
      @book = Book.new
  end

  def show
      @book = Book.find(params[:id])
  end

 private
  def book_params
        params.require(:book).permit(:title, :body)
  end
end