class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :timeoutable,
         :recoverable, :rememberable, :trackable, :validatable

  before_save :ensure_authentication_token
  before_create :default_values

  has_many :invitations, :class_name => self.to_s, :as => :invited_by
  belongs_to :role, inverse_of: :users

  def reset_authentication_token!
    self.authentication_token = generate_authentication_token
    save(:validate => false)
  end

  def has_role?(role_in_question)
    self.role.name.to_s == role_in_question.to_s
  end

  private

  def generate_authentication_token
    loop do
      token = Devise.friendly_token
      break token unless User.where(authentication_token: token).first
    end    
  end

  def ensure_authentication_token
    if authentication_token.blank?
      self.authentication_token = generate_authentication_token
    end
  end

  def default_values
    self.role ||= Role.find_by name: :delivery
  end

end
