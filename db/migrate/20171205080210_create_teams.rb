class CreateTeams < ActiveRecord::Migration[5.1]
  def change
    create_table :teams do |t|
      t.string :name
      t.string :gender
      t.string :season

      t.timestamps
    end
  end
end
