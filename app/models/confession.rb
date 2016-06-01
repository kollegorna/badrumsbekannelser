class Confession < ActiveRecord::Base
  belongs_to :user
  has_one :comment
  has_one :family, through: :user
  has_one :cell

  validates :user, :body, presence: true

  accepts_nested_attributes_for :comment, allow_destroy: true

  after_commit :update_mirrors!

  def update_mirrors!
    family.mirrors.each do |mirror|
      UpdateMirrorJob.perform_later(mirror.id)
    end
  end

  def featured?
    cell.present? ? true : false
  end
end
