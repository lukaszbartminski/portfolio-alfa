class CreateSkills < ActiveRecord::Migration[5.2]
  def change
    create_table :skills do |t|
      t.string :title
      t.integer :daily_percent_skill

      t.timestamps
    end
  end
end
