class PsychologyTestsController < ApplicationController
  def index
    @psychology_tests = PsychologyTest.all
    @test_search = @psychology_tests.ransack(params[:q])
    @psychology_tests = @test_search.result if params[:q].present?
  end

  def show
    @psychology_test = PsychologyTest.find(params[:id])
    session[:psychology_test_id] = @psychology_test.id
    @answer = Answer.new
  end
end
