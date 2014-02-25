class ArticlePolicy

  attr_reader :user, :article

  def initialize(user, article)
    @user = user
    @article = article
  end

  def create?
    user.role.name == "admin"
  end  

  def destroy?
    user == article.user
  end

  def update?
    user == article.user
  end

  def edit?
    user == article.user
  end

end
