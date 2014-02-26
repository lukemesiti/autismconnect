class EventPolicy

  attr_reader :user, :event

  def initialize(user, event)
    @user = user
    @event = event
  end

  def create?
    if user.present?
      user.role.name == "admin" || user.role.name == "professional"
    else
      false
    end
  end  

  def destroy?
    if user.present?
      user == event.user || user.role.name == "admin"
    else
      false
    end
  end

  def update?
    if user.present?
      user == event.user || user.role.name == "admin"
    else
      false
    end
  end

  def edit?
    if user.present?
      user == event.user || user.role.name == "admin"
    else
      false
    end
  end

end
