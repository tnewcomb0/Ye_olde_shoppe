class HomeController < ApplicationController
  include ApplicationHelper
  def index
    current_user
  end
end
