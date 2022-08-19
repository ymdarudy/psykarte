class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @psychology_tests = PsychologyTest.scoped_by_user(@user)
  end
end
