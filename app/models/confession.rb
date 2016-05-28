class Confession < ActiveRecord::Base
  belongs_to :user
  has_one :comment
  has_one :family, through: :user

  validates :user, :body, presence: true
  validates :excerpt, presence: true, if: Proc.new { |confession| confession.featured? }

  accepts_nested_attributes_for :comment, allow_destroy: true

  after_commit :update_mirrors!

  def update_mirrors!
    family.mirrors.each do |mirror|
      UpdateMirrorJob.perform_later(mirror.id)
    end
  end
end
