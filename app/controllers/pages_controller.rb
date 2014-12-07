class PagesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :about, :privacy]
  
  def index
  end
end
