class BooksController < ApplicationController

before_action :find_book, only: [:show, :edit, :update, :destroy]

  def index
    if params[:group].blank?
    @books = Book.all.sort()
  else
    @group_id = Group.find_by(name: params[:group])
    @books = Book.where(:group_id => @group_id)
  end
  end

  def new
    @book = current_user.books.build
    @authors = Author.all.map { |e| [e.name, e.id]  }
    @groups = Group.all.map { |e| [e.name, e.id]  }
    @chains = Chain.all.map { |e| [e.name, e.id]  }



  end

def home
  
end


  def show
    @lists = List.all
    @subjects = Subject.all
    @book = Book.find params[:id]
    @chains = Chain.all.map { |e| [e.name, e.id]  }


    @lists = List.where(user_id: current_user.id)
      @lists2 = @lists.map { |e| [e.name, e.id]  }



  end

  def mybooks
   @books = Book.all


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
    redirect_to books_path
  end

  def create
    @book = current_user.books.build(book_params)

    if @book.save
      redirect_to book_path(@book)
    else
      render 'new'
    end
  end




  private
  def book_params
    params.require(:book).permit(:title, :description, :author, :group_id, :author_id, :chain_id, :user_id, :list_id)
  end
def find_book
@book = Book.find(params[:id])
end

end
