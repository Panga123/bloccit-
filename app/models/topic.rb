class Topic < ApplicationRecord
  has_many :sponsoredposts, :posts, dependent: :destroy
end
