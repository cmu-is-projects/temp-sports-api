class CreateSurveys < ActiveRecord::Migration[5.1]
  def change
    create_table :surveys do |t|
      t.string :survey_type
      t.string :response

      t.timestamps
    end
  end
end
