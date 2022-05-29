class AddReferences < ActiveRecord::Migration[7.0]
  def change
    ## user - review
    # bundle exec rails g migration AddUserRefToReviews user:references
    add_reference :reviews, :user, null: false, foreign_key: true

    ## book - review
    # bundle exec rails g migration AddBookRefToReviews book:references
    add_reference :reviews, :book, null: false, foreign_key: true

    ## user - rental_history
    # bundle exec rails g migration AddUserRefToRentalHistories user:references
    add_reference :rental_histories, :user, null: false, foreign_key: true

    ## book - rental_history
    # bundle exec rails g migration AddBookRefToRentalHistories book:references
    add_reference :rental_histories, :book, null: false, foreign_key: true

    ## user - comment
    # bundle exec rails g migration AddUserRefToComments user:references
    add_reference :comments, :user, null: false, foreign_key: true

    ## review - comment
    # bundle exec rails g migration AddReviewRefToComments review:references
    # review を消しても comment を残したいので外部キー制約は貼らない
    add_reference :comments, :review, null: false, foreign_key: false
  end

end
