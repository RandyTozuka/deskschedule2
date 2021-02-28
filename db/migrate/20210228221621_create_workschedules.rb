class CreateWorkschedules < ActiveRecord::Migration[6.0]
  def change
    create_table :workschedules do |t|
      t.date :wdate
      t.references :user,   foreign_key: true
      t.references :status, foreign_key: true

      t.timestamps
    end
  end
end
