class PsychologyTestsController < ApplicationController
  def index
    @psychology_tests = PsychologyTest.all
  end

  def show
    @psychology_test = PsychologyTest.find(params[:id])
    session[:psychology_test_id] = @psychology_test.id
    @answer = Answer.new
  end
end
