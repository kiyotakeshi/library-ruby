# frozen_string_literal: true

json.comments do
  json.id @comment.id
  json.user_name @comment.user.name
  json.review_id @comment.review_id
  json.content @comment.content
  json.favorite_count @comment.favorite_count
  json.date @comment.date
  json.edited @comment.edited
end

