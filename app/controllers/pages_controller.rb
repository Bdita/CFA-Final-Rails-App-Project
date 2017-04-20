class PagesController < ApplicationController
     skip_before_action :authenticate_user!, only: [:home]
  def home
  end

  def admindashboard
     @users = User.all
     @images = Image.all
  end

  def ngodashboard
     @images = current_user.images
  end
end
