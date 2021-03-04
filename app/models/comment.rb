class Comment < ApplicationRecord
  belongs_to :users, optional: true
  belongs_to :posts, optional: true
end
