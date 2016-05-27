class Mirror < ActiveRecord::Base
  belongs_to :family
  has_many :confessions, through: :family

  validates :name, uniqueness: true, presence: true
end
