class PlistController < ApplicationController
  skip_before_filter :authenticate_user!
  before_filter :set_default_response_format
     
  respond_to :xml

  def show
    user = User.find_by(api_key: params[:id])
    if user
      @nodes = user.nodes
      respond_with @nodes
    else
      head :unauthorized
    end
  end

  protected

  def set_default_response_format
    request.format = 'xml'.to_sym if params[:format].nil?
  end
end
