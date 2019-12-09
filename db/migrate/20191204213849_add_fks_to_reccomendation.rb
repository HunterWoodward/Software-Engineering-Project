class AddFksToReccomendation < ActiveRecord::Migration[6.0]
  def change
    add_reference :reccomendations, :user, foreign_key: true
    add_reference :reccomendations, :comic, foreign_key: true
  end
end
