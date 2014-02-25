class LinkPolicy

  attr_reader :user, :link

  def initialize(user, link)
    @user = user
    @link = link
  end

  def create?
    if user.present?
      user.role.name == "admin"
    else
      false
    end
  end  

  def destroy?
    if user.present?
      user == link.user
    else
      false
    end
  end

  def update?
    if user.present?
      user == link.user
    else
      false
    end
  end

  def edit?
    if user.present?
      user == link.user
    else
      false
    end
  end

end
