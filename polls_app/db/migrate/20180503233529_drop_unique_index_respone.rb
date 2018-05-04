class DropUniqueIndexRespone < ActiveRecord::Migration[5.1]
  def change
    remove_index :responses, [:user_id, :answer_id]
    add_index :responses, :user_id
  end
end
