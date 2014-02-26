class UserPolicy
    class Scope < Struct.new(:user, :scope)
        def resolve
            role = Role.where(name: "professional").first
            if user
                if user.role.name == "user"
                    scope.where(role_id: role.id)
                else
                    scope.all
                end
            else
                scope.where(role_id: role.id)
            end
        end
    end

    attr_reader :current_user, :user

      def initialize(current_user, user)
        @current_user = current_user
        @user = user
      end
end
