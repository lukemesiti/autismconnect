class EventPolicy

  attr_reader :user, :event

  def initialize(user, event)
    @user = user
    @event = event
  end

  def create?
    user.role.name == "admin" || user.role.name == "professional"
  end  

  def destroy?
    user == event.user || user.role.name == "admin"
  end

  def update?
    user == event.user || user.role.name == "admin"
  end

  def edit?
    user == event.user || user.role.name == "admin"
  end

end
