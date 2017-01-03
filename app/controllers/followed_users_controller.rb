class FollowedUsersController < ApplicationController
  def index
    @followed_users = current_user.followed_users.all
  end
end
