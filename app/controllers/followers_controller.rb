class FollowersController < ApplicationController
  def index
      @followers = current_user.followers.all
  end
end
