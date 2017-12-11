class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_attached_file :profile_picture, styles: { medium: "500x500>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
   validates_attachment_content_type :profile_picture, content_type: /\Aimage\/.*\z/

   has_many :skills
   has_many :experiences
   has_many :educations



  def full_name
    return "#{first_name} #{last_name}"
  end

end
