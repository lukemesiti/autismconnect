class ArticlePolicy

  attr_reader :user, :article

  def initialize(user, article)
    @user = user
    @article = article
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
      user == article.user
    else
      false
    end
  end

  def update?
    if user.present?
      user == article.user
    else
      false
    end
  end

  def edit?
    if user.present?
      user == article.user
    else
      false
    end
  end

end
