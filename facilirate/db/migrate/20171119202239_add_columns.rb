class AddColumns < ActiveRecord::Migration
  def change
    add_column :reviews, :user_id, :integer
    add_column :reviews, :room_id, :integer
  end
end
