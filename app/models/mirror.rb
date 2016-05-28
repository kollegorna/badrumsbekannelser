class Mirror < ActiveRecord::Base
  belongs_to :family
  has_many :confessions, through: :family

  validates :name, uniqueness: true, presence: true

  after_commit :update_mirrors!

  def update_mirrors!
    UpdateMirrorJob.perform_later(id)
  end
end
