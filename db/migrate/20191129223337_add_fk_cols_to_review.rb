class AddFkColsToReview < ActiveRecord::Migration[6.0]
  def change
    add_reference :reviews, :comic, foreign_key: true
    add_reference :reviews, :series, foreign_key: true
    add_reference :reviews, :user, foreign_key: true
    add_reference :discussions, :review, foreign_key: true
  end
end
