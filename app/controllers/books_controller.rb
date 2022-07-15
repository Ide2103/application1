class BooksController < ApplicationController

  def create
    @book = Book.new(book_params)
    @books = Book.all
     if @book.save
       redirect_to book_path(@book.id)
       flash[:notice] = "Book was successfully updated."
     else
       render :index
     end
  end

  def index
   @books = Book.all
   @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    if @book.save
      redirect_to book_path(@book.id)
      flash[:notice] = "Book was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to '/books'
  end

private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end
end