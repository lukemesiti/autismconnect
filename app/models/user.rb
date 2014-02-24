class User < ActiveRecord::Base
    belongs_to :role

    
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :events
  has_many :links
  has_many :articles
  has_many :invites
end
