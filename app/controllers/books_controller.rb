class BooksController < ApplicationController
  def new
  end
  
  
  
  def index
    @list = Book.new
    @lists = Book.all
   
  end
  
  def create
    list = Book.new(book_params)
    if list.save
    redirect_to book_path(list.id),flash: {notice: 'Book was successfully updated'}
    else
      @lists = Book.all
      @list = list
      render :index
    end
  end

  def show
    @list = Book.find(params[:id])
  end

  def edit
    @list = Book.find(params[:id])
  end
  def update
    list = Book.find(params[:id])
    if list.update(book_params)
    redirect_to book_path(list.id),flash: {notice: 'Book was successfully updated'}
    else
      @list = list
      render :edit
    end
  end
  
  def destroy
    list = Book.find(params[:id])
  if list.destroy
    redirect_to '/books',flash: {notice: 'Book was successfully destroyed'}
  else
    @lists = list.all
    @list = list
    render :index
  end
  end
  
  private
  def book_params
    params.require(:book).permit(:title,:body)
  end
end
