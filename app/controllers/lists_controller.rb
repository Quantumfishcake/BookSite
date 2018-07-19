class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def show
    @list = List.find params[:id]
  end


  def new
    @list = current_user.lists.build
  end


  def create
    @list = current_user.lists.build(list_params)

    if @list.save
      redirect_to list_path(@list)
    else
      render 'new'
    end
  end

  def destroy
    @list = List.find params[:id]
    @list.destroy
    redirect_to '/lists'
  end


  private
  def list_params
    params.require(:list).permit(:name, :user_id)
  end

end
