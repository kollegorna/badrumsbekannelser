class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :rememberable, :trackable, :validatable,
         authentication_keys:   [:username],
         case_insensitive_keys: [:username],
         strip_whitespace_keys: [:username]

  belongs_to :family, counter_cache: true
  has_many :confessions

  validates :first_name, :last_name, :family, :alias, :birthdate, presence: true
  validates :username, length: { minimum: 4 }, uniqueness: true, presence: true

  def to_s
    name
  end

  def name
    "#{first_name} #{last_name}"
  end

  def age
    ((Time.zone.now - birthdate.to_time)/1.year.to_i).floor if birthdate
  end

  def password_required?
    new_record? || password.present? || password_confirmation.present?
  end

  def email_required?
    false
  end

  def email_changed?
    false
  end
end
