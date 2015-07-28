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

  def edit
    @node = nodes.find(params[:id])
  end

  def update
    @node = nodes.find(params[:id])
    if @node.update(node_params)
      redirect_to nodes_url
    else
      render :edit
    end
  end

  private

  def nodes
    Node.all
  end

  def node_params
    params.require(:node).permit(
      :name, :aetitle, :address, :port, :retrieve_mode, :transfer_syntax)
  end
end
