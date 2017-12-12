class AddCompenyToTestemonial < ActiveRecord::Migration[5.0]
  def change
    add_column :testimonials, :company, :string
  end
end
