class PagesController < ApplicationController
     skip_before_action :authenticate_user!, only: [:home]
  def home
       @images = Image.all
       @contact = Contact.new
  end

  def admindashboard
     authorize self
     @users = User.all
     @images = Image.all
     @q = Image.ransack(params[:q])
     @images = @q.result #(distinct: true)
  end

  def ngodashboard
      authorize self
     @images = current_user.images
  end
end
