class GossipsController < ApplicationController
  def index
    @gossips = Gossip.all
  end

  def new
    @gossip = Gossip.new
  end

  def create
    @gossip =  Gossip.new(gossip_param)
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


  private
    def gossip_param
      params.require(:gossip).permit(:anonymous_author, :content)
    end
end
