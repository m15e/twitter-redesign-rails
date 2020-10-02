class FollowingsController < ApplicationController

  def follow(follower, followed)
    flash.now[:notice] = 'You now follow'
    @follow = Following.create(follower_id: follower, followed_id: followed)
    if @follow.save!
      flash[:notice] = 'You now follow'
      redirect_to request.refferer
    end
  end

  def unfollow

  end

end
