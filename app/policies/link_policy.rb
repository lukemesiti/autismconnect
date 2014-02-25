class LinkPolicy

  attr_reader :user, :link

  def initialize(user, link)
    @user = user
    @link = link
  end

  def create?
    user.role.name == "admin"
  end  

  def destroy?
    user == link.user
  end

  def update?
    user == link.user
  end

  def edit?
    user == link.user
  end

end
