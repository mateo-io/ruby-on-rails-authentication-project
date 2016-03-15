class Post < ActiveRecord::Base
  belongs_to :author
  validates :title, presence: true, length: {maximum: 70}
  validates :body, presence: true, length: {maximum: 1000}
end
