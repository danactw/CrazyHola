class AddUserId < ActiveRecord::Migration[6.1]
  def change
    # add_column :courses, :user_id, :integer
    add_reference :courses, :user, index: true
  end
end
