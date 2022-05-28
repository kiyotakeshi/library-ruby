class CreateTables < ActiveRecord::Migration[7.0]

  def change
    ## if you want to create model
    # bundle exec rails g model Users email password role_type joining_date:date

    ## if you want to create controller
    # bundle exec rails g controller Users

    ## user
    # bundle exec rails g migration CreateUsers email name password role_type joining_date:date
    create_table :users do |t|
      t.string :email, null: false
      t.string :name, null: false
      t.string :password
      t.column :role_type, "enum('admin', 'user')", null: false
      t.date :joining_date, comment: 'チーム加入日', null: false

      t.timestamps
    end

    ## review
    # bundle exec rails g migration CreateReviews title content rating:integer date:date
    # bundle exec rails g model Reviews title content rating:integer date:date
    create_table :reviews do |t|
      t.string :title, null: false
      t.string :content, null: false
      t.integer :rating, null: false
      t.date :date, null: false

      t.timestamps
    end

    ## book
    # bundle exec rails g migration CreateBooks title description published:date rent:boolean return_date:date
    # bundle exec rails g model Books title description published:date rent:boolean return_date:date
    # bundle exec rails g controller Books
    create_table :books do |t|
      t.string :title, null: false
      t.string :description, null: false
      t.date :published, null: false
      t.boolean :rent, default: false, comment: '借りられているか'
      t.date :return_date, comment: '返却日'

      t.timestamps
    end

    ## category
    # bundle exec rails g migration CreateCategories name
    # bundle exec rails g model Categories name
    # bundle exec rails g controller Categories
    create_table :categories do |t|
      t.string :name, null: false

      t.timestamps
    end

    ## comment
    # bundle exec rails g migration CreateComments content:text favorite_count:integer date:date edited:boolean
    create_table :comments do |t|
      t.text :content, null: false
      t.integer :favorite_count
      t.date :date, null: false
      t.boolean :edited, default:false

      t.timestamps
    end

    ## rental_history
    # bundle exec rails g migration CreateRentalHistories start_date:date return_date:date
    create_table :rental_histories do |t|
      t.date :start_date, null: false
      t.date :return_date, null: false

      t.timestamps
    end
  end
end
