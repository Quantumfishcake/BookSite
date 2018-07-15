class BooksController < ApplicationController

before_action :find_book, only: [:show, :edit, :update, :destroy]

  def index
    if params[:category].blank?
    @books = Book.all
  else
    @category_id = Category.find_by(name: params[:category])
    @books = Book.where(:category_id => @category_id)
  end
  end

  def new
    @book = current_user.books.build
    @authors = Author.all.map { |e| [e.name, e.id]  }

    @categories = Category.all.map { |e| [e.name, e.id]  }
  end

  def show
    @book = Book.find params[:id]
  end

  def edit
    @categories = Category.all.map { |e| [e.name, e.id]  }
    @authors = Author.all.map { |e| [e.name, e.id]  }
  end


  def update
    @book.category_id = params[:category_id]
    @book.author_id = params[:author_id]
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
    @book = current_user.books.build(book_params)
    @book.category_id = params[:category_id]
    if @book.save
      redirect_to root_path
    else
      render 'new'
    end
  end


  private
  def book_params
    params.require(:book).permit(:title, :description, :author, :category_id, :author_id)
  end
def find_book
@book = Book.find(params[:id])
end

end
