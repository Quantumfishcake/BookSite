class AuthorsController < ApplicationController
  def index
    @authors = Author.all.sort()
  end

def show
  @author = Author.find params[:id]

end

def new
  @author = Author.new
  @group = Group.all.map { |e| [e.name, e.id]  }

  if params[:name].present?
    @nameparams = params[:name]
  end
end

def create
  @author = Author.create (author_params)

  if @author.save
    redirect_to author_path(@author)
  else
    render 'new'
  end
end

def edit
  @author = Author.find params[:id]
  @group = Group.all.map { |e| [e.name, e.id]  }
end

def update
  @author = Author.find params[:id]
  @author.update author_params
  if @author.update(author_params)
    redirect_to author_path(@author)
  else
    render 'edit'
  end
end


def destroy
  @author = Author.find params[:id]
  @author.destroy
  redirect_to root_path
end

private
def author_params
  params.require(:author).permit(:name, :image,)
end

end
