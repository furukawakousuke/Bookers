class BooksController < ApplicationController
  def new
  end
  
  
  
  def index
    @list = List.new
    @lists = List.all
   
  end
  
  def create
    list = List.new(book_params)
    if list.save
    redirect_to show_path(list.id),flash: {notice: 'Book was successfully updated'}
    else
      @lists = List.all
      @list = list
      render :index
    end
  end

  def show
    @list = List.find(params[:id])
  end

  def edit
    @list = List.find(params[:id])
  end
  def update
    list = List.find(params[:id])
    if list.update(book_params)
    redirect_to show_path(list.id),flash: {notice: 'Book was successfully updated'}
    else
      @list = list
      render :edit
    end
  end
  
  def destroy
    list = List.find(params[:id])
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
    params.require(:list).permit(:title,:body)
  end
end
