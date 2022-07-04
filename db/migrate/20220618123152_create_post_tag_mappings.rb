class CreatePostTagMappings < ActiveRecord::Migration[7.0]
  def change
    create_table :post_tag_mappings do |t|
      t.integer :tag_id
      t.integer :post_id

      t.timestamps
    end
  end
end
