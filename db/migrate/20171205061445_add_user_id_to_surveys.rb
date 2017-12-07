class AddUserIdToSurveys < ActiveRecord::Migration[5.1]
  def change
    add_column :surveys, :user_id, :integer
  end
end
