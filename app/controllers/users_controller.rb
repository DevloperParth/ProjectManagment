class UsersController < ApplicationController
  # before_filter :authenticate_user!
  # before_filter :admin_only, :except => :show
  def welcome
    @users = User.all    
  end

end
