class User < ActiveRecord::Base
    
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauth_providers => [:google_oauth2]
 
  has_many :events
  has_many :links
  has_many :articles
  has_many :invites
  belongs_to :role

  # make sure you're a default role, so no-one has an empty role (this default is set in role.rb)
  before_create :set_default_role

  def set_default_role
    self.role = Role.default_role
  end

  def admin?
    self.role.present? && self.role.admin?
  end

  # method for making the current role an admin (useful to set admins from console)
  def make_me_admin
    self.update_attribute(:role, Role.admin_role)
  end

  # This method will catch if you're not an admin, and return you a default if you try to fake being an admin.
  def can_change_to_role?(role_id)
    the_role = Role.find_by_id(role_id)
    return Role.default_role.id if the_role.blank?
    return the_role.id if self.admin? || !the_role.admin?
    Role.default_role.id
  end


  def self.find_for_google_oauth2(access_token, signed_in_resource=nil)
    data = access_token.info
    user = User.where(:email => data["email"]).first

    unless user
        user = User.create(name: data["name"],
             email: data["email"],
             password: Devise.friendly_token[0,20]
            )
    end
    user
  end


  #forem ..ahem, forum helpers (It's used in the gem code)
  def to_s
    name
  end

  #this code was supposedly required by forem but causes a stack overflow!
  # def email
  #   email
  # end





end
