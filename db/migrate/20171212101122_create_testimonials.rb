class CreateTestimonials < ActiveRecord::Migration[5.0]
  def change
    create_table :testimonials do |t|
      t.string :persons_name
      t.string :persons_designantion
      t.text :description
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
