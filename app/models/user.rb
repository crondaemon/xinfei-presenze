class User < ActiveRecord::Base
  include Authorizable

  has_many :presences, dependent: :destroy

  # Include default devise modules. Others available are:
  # :registerable, :confirmable, :lockable and :omniauthable

  # Virtual attribute for authenticating by either username or email
  attr_accessor :login

  devise :database_authenticatable, :recoverable, :rememberable, :trackable,
         :timeoutable, :omniauthable

  validates :username, presence: true, uniqueness: { scope: :provider, case_sensitive: false }

  before_validation :fix_values

  def display_name
    fullname.presence || username
  end

  def fix_values
    self.fullname = self.fullname.split.map(&:capitalize).join(' ')
    
    self.username = fullname.gsub(" ", '').downcase if !self.username || self.username.empty?
    if !self.password
      self.password = SecureRandom.hex(16)
      self.password_confirmation = self.password
    end
    self.email = "#{self.username}@xinfei.org" if !self.email || self.email.empty?
  end

  # Devise method overridden to allow sign in with email or username
  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    login = conditions.delete(:login)
    if login
      where(conditions).where(['lower(username) = :value OR lower(email) = :value', { value: login.downcase }]).first
    else
      where(conditions).first
    end
  end

  def present?(day)
    self.presences.where(when: day).size > 0
  end
end
