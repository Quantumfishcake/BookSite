class BooksController < ApplicationController

before_action :find_book, only: [:show, :edit, :update, :destroy]

  def index
    if params[:group].blank?
    @books = Book.all
  else
    @group_id = Group.find_by(name: params[:group])
    @books = Book.where(:group_id => @group_id)
  end
  end

  def new
    @book = Book.new
    @authors = Author.all.map { |e| [e.name, e.id]  }
    @groups = Group.all.map { |e| [e.name, e.id]  }

  end

  def show
    @book = Book.find params[:id]
  end

  def edit
    @groups = Group.all.map { |e| [e.name, e.id]  }
    @authors = Author.all.map { |e| [e.name, e.id]  }
  end


  def update
    @book.update book_params
    if @book.update(book_params)
      redirect_to book_path(@book)
    else
      render 'edit'
    end
  end

  def destroy
    @book.destroy
    redirect_to root_path
  end

  def create
    @book = Book.create(book_params)

    if @book.save
      redirect_to root_path
    else
      render 'new'
    end
  end


  private
  def book_params
    params.require(:book).permit(:title, :description, :author, :group_id, :author_id)
  end
def find_book
@book = Book.find(params[:id])
end

end
