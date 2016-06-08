class Cell < ActiveRecord::Base
  acts_as_list

  belongs_to :confession

  delegate :excerpt, :body, :published_at, to: :confession

  validates :confession, presence: true, uniqueness: true
  validates :excerpt, :published_at, presence: true
end
