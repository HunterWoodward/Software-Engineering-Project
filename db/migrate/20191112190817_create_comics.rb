class CreateComics < ActiveRecord::Migration[6.0]
  def change
    create_table :comics do |t|
      t.string :title
      t.integer :issue_number
      t.text :description
      t.string :comic_type

      t.timestamps
    end
  end
end
