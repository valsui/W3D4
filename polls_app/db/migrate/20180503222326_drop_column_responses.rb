class DropColumnResponses < ActiveRecord::Migration[5.1]
  def change
    remove_index :responses, [:user_id, :question_id]
    remove_index :responses, :question_id
    remove_column :responses, :question_id, null: false
    add_index :responses, [:user_id, :answer_id], unique: true
  end
end
