class Confession < ActiveRecord::Base
  belongs_to :user
  has_one :comment

  validates :user, :body, presence: true

  accepts_nested_attributes_for :comment, allow_destroy: true
end
