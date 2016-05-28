class Family < ActiveRecord::Base
  has_many :users
  has_many :confessions, through: :users
  has_many :mirrors

  validates :name, presence: true
end
