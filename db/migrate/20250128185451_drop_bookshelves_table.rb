class DropBookshelvesTable < ActiveRecord::Migration[7.1]
  def up
    drop_table :bookshelves
  end

  def down
    create_table :bookshelves do |t|
      t.string :title
      t.string :author
      t.string :published_year
      t.timestamps
    end
  end
end
