class DocumentPolicy

  attr_reader :user, :document

  def initialize(user, document)
    @user = user
    @document = document
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
      user == document.user || user.role.name == "admin"
    else
      false
    end
  end

  def update?
    if user.present?
      user == document.user || user.role.name == "admin"
    else
      false
    end
  end

  def edit?
    if user.present?
      user == document.user || user.role.name == "admin"
    else
      false
    end
  end

end
