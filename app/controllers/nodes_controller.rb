class NodesController < ApplicationController
  def index
    @nodes = nodes
  end

  def new
    @node = nodes.new
  end

  def create
    @node = nodes.new(node_params)
    if @node.save
      redirect_to nodes_path
    else
      render :new
    end
  end

  def destroy
    @node = nodes.find(params[:id])
    @node.destroy
    redirect_to nodes_url
  end

  private

  def nodes
    current_user.nodes
  end

  def node_params
    params.require(:node).permit(:address, :port, :aetitle, :name)
  end
end
