class CreateCommentsTable < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.integer :user_id
      t.integer :source_id
      t.text :text

      t.timestamps
    end
    add_index('comments', ['user_id', 'source_id'])
  end
end
