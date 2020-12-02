class Post < ApplicationRecord
  validates :title, :official_url, :opposite_url, :official_photo, :opposite_photo, presence: true
end

# t.string :title, null:false
# t.string :official_url, null:false
# t.string :opposite_url, null:false
# t.string :official_photo, null:false
# t.string :opposite_photo, null:false