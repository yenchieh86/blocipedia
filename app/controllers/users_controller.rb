class UsersController < ApplicationController

  def show
  end

  def downgrade
    if current_user.premium?
      current_user.standard!
      flash[:notice] = "Your account has become a standard account."
      redirect_to user_path(current_user.id)
    else
      flash[:alert] = "You're account is a standard account."
      render user_path(current_user.id)
    end
  end
end