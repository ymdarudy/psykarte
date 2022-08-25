class UsersController < ApplicationController
  before_action :admin_user?

  def show
    @user = User.find(params[:id])
    @psychology_tests = PsychologyTest.scoped_by_user_answered(@user)
  end

  private

  def admin_user?
    return if current_user.admin? || User.find(params[:id]) == current_user
    redirect_to root_path, notice: "他のユーザーページにはアクセスできません"
  end
end
