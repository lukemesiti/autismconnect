class UserPolicy

  attr_reader :user, :user

  def initialize(user, user)
    @user = user
  end

  def index?
    if user.present?
      user.role.name == "admin"
    else
      false
    end
  end  

end
