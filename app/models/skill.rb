class Skill < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :catagory, presence: true,
    :inclusion  => { :in => [ 'soft_skills', 'design', 'coding'],
    :message    => "%{value} is not a valid skill category" }
  validates :level, presence: true

end
