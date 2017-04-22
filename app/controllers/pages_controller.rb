class PagesController < ApplicationController
     skip_before_action :authenticate_user!, only: [:home]
  def home
  end

  def admindashboard
     authorize self
     @users = User.all
     @images = Image.all
  end

  def ngodashboard
      authorize self
     @images = current_user.images
  end
end
