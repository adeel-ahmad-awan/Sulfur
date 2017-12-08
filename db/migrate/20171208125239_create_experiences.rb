class CreateExperiences < ActiveRecord::Migration[5.0]
  def change
    create_table :experiences do |t|
      t.string :company_name
      t.text :company_location
      t.string :position
      t.text :description
      t.date :from
      t.date :to
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
