# frozen_string_literal: true

class FollowersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all.where.not(id: current_user.id)
  end

  def create
    Follower.new(follower_params).save
    redirect_back_or_to root_path
  end

  def destroy
    follower = Follower.find(params[:id])
    follower.destroy

    redirect_back_or_to root_path
  rescue StandardError
    redirect_back_or_to root_path
  end

  private

  def follower_params
    params.require(:follower).permit(:followed_user_id, :followed_by_user_id)
  end
end
