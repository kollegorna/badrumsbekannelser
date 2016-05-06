class Confession < ActiveRecord::Base
  belongs_to :user
  has_one :comment

  validates :user, :body, presence: true
end
