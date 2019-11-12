class CreateComics < ActiveRecord::Migration[6.0]
  def change
    create_table :comics do |t|
      t.string, :title
      t.integer, :issue_number
      t.Text, :description
      t.String :type

      t.timestamps
    end
  end
end
