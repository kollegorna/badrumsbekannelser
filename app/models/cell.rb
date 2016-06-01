class Cell < ActiveRecord::Base
  acts_as_list

  belongs_to :confession

  delegate :excerpt, :body, to: :confession

  validates :confession, presence: true, uniqueness: true
  validates :excerpt, presence: true
end
