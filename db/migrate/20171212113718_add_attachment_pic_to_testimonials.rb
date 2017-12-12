class AddAttachmentPicToTestimonials < ActiveRecord::Migration
  def self.up
    change_table :testimonials do |t|
      t.attachment :pic
    end
  end

  def self.down
    remove_attachment :testimonials, :pic
  end
end
