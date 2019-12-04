class AddComicFkColToDiscussions < ActiveRecord::Migration[6.0]
  def change
    add_reference :discussions, :comic, foreign_key: true
  end
end
