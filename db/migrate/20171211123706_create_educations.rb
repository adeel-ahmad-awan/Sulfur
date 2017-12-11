class CreateEducations < ActiveRecord::Migration[5.0]
  def change
    create_table :educations do |t|
      t.string :institute
      t.string :degree
      t.text :description
      t.date :from
      t.date :to
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
