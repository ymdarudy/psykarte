class PsychologyTestsController < ApplicationController
  def index
    @psychology_tests = PsychologyTest.all
  end

  def show
  end
end
