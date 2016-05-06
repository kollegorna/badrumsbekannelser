class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :family, counter_cache: true

  validates :first_name, :last_name, :family, presence: true

  def to_s
    name
  end

  def name
    "#{first_name} #{last_name}"
  end
end
