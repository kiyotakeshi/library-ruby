class CreateJoinTables < ActiveRecord::Migration[7.0]
  def change
    ## books_categories
    # bundle exec rails g migration CreateBooksCategories book:references category:references
    create_table :books_categories do |t|
      t.references :book, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
