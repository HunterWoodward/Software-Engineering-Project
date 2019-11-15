class AddComicFkColToPage < ActiveRecord::Migration[6.0]
  def change
    add_reference :pages, :comic, foreign_key: true
  end
end
