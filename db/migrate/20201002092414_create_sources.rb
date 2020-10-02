class CreateSources < ActiveRecord::Migration[6.0]
  def change
    create_table :sources do |t|
      t.integer :author_id
      t.string :text

      t.timestamps
    end
    add_index('sources', 'author_id')
  end
end
