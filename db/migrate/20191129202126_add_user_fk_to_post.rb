class AddUserFkToPost < ActiveRecord::Migration[6.0]
  def change
    add_reference :posts, :user, foriegn_key: true
  end
end
