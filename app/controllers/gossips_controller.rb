class GossipsController < ApplicationController
  def index
    @gossips = Gossip.all
  end

  def new
    @gossip = Gossip.new
  end

  def create
    @gossip =  Gossip.new(gossip_params)
    @gossip.save
    #fait appel à la fonction show avec l'id du gossip
    redirect_to @gossip
  end

  def show
    @gossip = Gossip.find(params[:id])
  end

  def edit
    @gossip = Gossip.find(params[:id])
  end

  def update
    @gossip = Gossip.find(params[:id])
    @gossip.update(gossip_params)
    redirect_to @gossip
  end

  def destroy
    Gossip.find(params[:id]).destroy
    redirect_to gossips_path
  end





  private
    def gossip_params
      params.require(:gossip).permit(:anonymous_author, :content)
    end
end
