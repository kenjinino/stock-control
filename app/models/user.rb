class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :token_authenticatable, :timeoutable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :invitations, :class_name => self.to_s, :as => :invited_by
end
