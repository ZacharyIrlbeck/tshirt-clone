class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :find_user
  def index
    @users = User.all
  end

  def show
  end

  def edit
  end

  def update
  end

  private

  def find_user
    @user = User.find(params[:id])
  end
end
