class PsychologyTestsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @psychology_tests = PsychologyTest.all
    @test_search = @psychology_tests.ransack(params[:q])
    @psychology_tests = @test_search.result if params[:q].present?
    if params[:unanswered] && current_user.present?
      @psychology_tests = PsychologyTest.scoped_by_user_unanswered(current_user)
    elsif params[:unanswered] && current_user.nil?
      flash.now[:notice] = "ログインすると利用できます。"
    end
    if params[:favorite] && current_user.present?
      @psychology_tests = current_user.favorite_tests
    elsif params[:favorite] && current_user.nil?
      flash.now[:notice] = "ログインすると利用できます。"
    end
  end

  def show
    @psychology_test = PsychologyTest.find(params[:id])
    @answer = Answer.new
    flash.now[:notice] = "ログインすると回答できます。"
  end
end
