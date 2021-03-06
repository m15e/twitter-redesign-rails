class CreateFollowings < ActiveRecord::Migration[6.0]
  def change
    create_table :followings do |t|
      t.integer 'follower_id'
      t.integer 'followed_id'
    end
    add_index('followings', ['follower_id', 'followed_id'])
  end
end
