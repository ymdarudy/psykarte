class PsychologyTestsController < ApplicationController
  def index
    @psychology_tests = PsychologyTest.all
  end

  def show
    @psychology_test = PsychologyTest.find(params[:id])
  end
end
