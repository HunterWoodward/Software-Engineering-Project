class AddDiscussionFkColToPosts < ActiveRecord::Migration[6.0]
  def change
    add_reference :posts, :discussion, foreign_key: true
  end
end
