class FollowingsController < ApplicationController

  def follow
    flash.now[:notice] = 'You now follow'    
    @follow = Following.create(following_params)
    redirect_to request.referrer
  end

  def unfollow
    @following = Following.where(following_params).first
    @following.destroy
    flash[:notice] = 'unfollowed'
    redirect_to request.referrer
  end

  private

  def following_params
    params.permit(:follower_id, :followed_id)
  end

end
