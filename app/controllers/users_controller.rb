class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @psychology_tests = PsychologyTest.scoped_by_user_answered(@user)
  end
end
