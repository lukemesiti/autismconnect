class LinkPolicy
  # class Scope < Struct.new(:user, :scope)
  #   def resolve
  #     scope
  #   end
  # end

  attr_reader :user, :link

  def initialize(user, link)
    @user = user
    @link = link
  end  

  def destroy?
    user == link.user
  end

  def update?
    # if post.published == false
    #   user == post.user
    # else
    #   false
    # end
  end

  def edit?
    # if post.published == false
    #   user == post.user
    # else
    #   false
    # end
  end

end
