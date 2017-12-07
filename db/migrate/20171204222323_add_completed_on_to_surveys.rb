class AddCompletedOnToSurveys < ActiveRecord::Migration[5.1]
  def change
    add_column :surveys, :completed_on, :datetime
  end
end
