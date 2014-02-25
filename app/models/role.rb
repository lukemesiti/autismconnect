class Role < ActiveRecord::Base
  has_many :users

  def admin?
    self.name == "admin"
  end

  #this determines the default role everybody is given on sign_up
  def self.default_role
    self.find_by(name: "parent")
  end

  def self.admin_role
  	self.find_by(name: "admin")
  end
end
