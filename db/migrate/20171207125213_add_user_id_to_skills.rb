class AddUserIdToSkills < ActiveRecord::Migration[5.0]
  def change
    add_reference :skills, :user, index: true
  end
end
