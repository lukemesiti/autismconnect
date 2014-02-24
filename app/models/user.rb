class User < ActiveRecord::Base
    belongs_to :role

    
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauth_providers => [:google_oauth2]
 
  has_many :events
  has_many :links
  has_many :articles
  has_many :invites

  def self.from_omniauth(auth)
    if user = User.find_by_email(auth.info.email)
      # user.provider = auth.provider
      # user.uid = auth.uid
      user
    else
      where(auth.slice(:provider, :uid)).first_or_create do |user|
        user.email = auth.info.email
      end
    end
  end

end
