class Post < ApplicationRecord
  validates :title, :url, :photo, presence: true
end
