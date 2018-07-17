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
    @chains = Chain.all.map { |e| [e.name, e.id]  }
    if params[:chain_id].present?
      @chainparams = params[:chain_id]
      @chain = Chain.find_by(id: @chainparams)
    end
    if params[:author_id].present?
      @authorparams = params[:author_id]
      @author = Author.find_by(id: @authorparams)
    end


  end



  def show
    @book = Book.find params[:id]


  end

  def edit
    @chains = Chain.all.map { |e| [e.name, e.id]  }
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
      redirect_to book_path(@book)
    else
      render 'new'
    end
  end


  private
  def book_params
    params.require(:book).permit(:title, :description, :author, :group_id, :author_id, :chain_id)
  end
def find_book
@book = Book.find(params[:id])
end

end
