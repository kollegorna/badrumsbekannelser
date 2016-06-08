class Confession < ActiveRecord::Base
  belongs_to :user
  has_one :comment
  has_one :family, through: :user
  has_one :cell, dependent: :destroy

  validates :user, :body, presence: true

  accepts_nested_attributes_for :comment, allow_destroy: true

  after_commit :update_mirrors!, on: [:create, :update]

  scope :published, -> { where('published_at < ?', Time.zone.now) }

  def update_mirrors!
    family.mirrors.each do |mirror|
      UpdateMirrorJob.perform_later(mirror.id)
    end
  end

  def featured?
    cell.present? ? true : false
  end

  def published
    if published_at.present?
      return published_at < Time.zone.now
    end

    false
  end

  def published=(boolean)
    if ActiveRecord::Type::Boolean.new.type_cast_from_user(boolean)
      self.published_at = Time.zone.now
    else
      self.published_at = nil
    end
  end

  def published?
    published
  end

  def editable?
    created_at > 30.minutes.ago ? true : false
  end

  def remaining_time
    seconds = ((created_at + 30.minutes) - Time.zone.now).to_i

    seconds.positive? ? seconds : 0
  end
end
