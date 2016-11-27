class CreateMatches < ActiveRecord::Migration[5.0]
  def change
    create_table :matches do |t|
      t.integer :home_team_id, null: false
      t.integer :away_team_id, null: false
      t.datetime :date
      t.integer :value1
      t.integer :value2

      t.timestamps null: false
    end
  end
end
