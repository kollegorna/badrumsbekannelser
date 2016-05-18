class Family < ActiveRecord::Base
  has_many :users
  has_many :confessions, through: :users

  validates :name, presence: true
end
