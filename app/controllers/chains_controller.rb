class ChainsController < ApplicationController
  def index
    @chains = Chain.all
  end

  def show
  @chain = Chain.find params[:id]

  end

  def new
  @chain = Chain.new

  @group = Group.all.map { |e| [e.name, e.id]  }
  end

  def create
  @chain = Chain.create (chain_params)

  if @chain.save
    redirect_to chains_path
  else
    render 'new'
  end
  end


  def edit


    @chain = Chain.find params[:id]
  end

  def destroy
    @chain = Chain.find params[:id]
    @chain.destroy
    redirect_to root_path
  end


  def update
    @chain = Chain.find params[:id]
    @chain.update chain_params
    if @chain.update(chain_params)
      redirect_to chain_path(@chain)
    else
      render 'edit'
    end
  end




  private
  def chain_params
  params.require(:chain).permit(:name, :numbooks,)
  end
end
