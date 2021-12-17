class Review < ApplicationRecord
  belongs_to :user
  belongs_to :course, counter_cache: true
end
