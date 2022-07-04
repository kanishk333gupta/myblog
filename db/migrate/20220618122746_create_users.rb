class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.integer :contact
      t.date :dob
      t.string :pw

      t.timestamps
    end
  end
end
