class PsychologyTestsController < ApplicationController
  def index
    @psychology_tests = PsychologyTest.all
    @test_search = @psychology_tests.ransack(params[:q])
    @psychology_tests = @test_search.result if params[:q].present?
    @psychology_tests = PsychologyTest.scoped_by_user_unanswered(current_user) if params[:unanswered]
    @psychology_tests = current_user.favorite_tests if params[:favorite]
  end

  def show
    @psychology_test = PsychologyTest.find(params[:id])
    session[:psychology_test_id] = @psychology_test.id
    @answer = Answer.new
  end
end
