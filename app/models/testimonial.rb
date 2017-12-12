class Testimonial < ApplicationRecord

  has_attached_file :pic, styles: { medium: "500x500>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :pic, content_type: /\Aimage\/.*\z/

  belongs_to :user
end
