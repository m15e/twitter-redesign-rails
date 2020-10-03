class FollowingsController < ApplicationController

  def follow
    flash.now[:notice] = 'You now follow'
    p following_params
    @follow = Following.create(following_params)
    redirect_to request.referrer
  end

  def unfollow

  end

  private

  def following_params
    params.permit(:follower_id, :followed_id)
  end

end
