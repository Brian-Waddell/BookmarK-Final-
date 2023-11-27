json.extract! book, :id, :title, :author, :summary, :genre, :publish_date, :user_id, :photo, :created_at, :updated_at
json.url book_url(book, format: :json)
