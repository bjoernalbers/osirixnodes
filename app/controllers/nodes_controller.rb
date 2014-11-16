class NodesController < ApplicationController
  def index
    @nodes = nodes
  end

  private

  def nodes
    current_user.nodes
  end
end
