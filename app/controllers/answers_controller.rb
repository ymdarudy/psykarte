class AnswersController < ApplicationController
  def create
    questions = Question.where(personality: Personality.where(psychology_test_id: session[:psychology_test_id]))
    if questions.count != params[:answer]&.keys&.size
      redirect_to request.referrer, notice: "未回答の設問がありました。すべて回答してください。"
      # TODO: 完成後に消去。
      # @psychology_test = PsychologyTest.find(session[:psychology_test_id])
      # @answer = Answer.new
      # flash.now[:alert] = "未回答の設問があります。すべて回答してください。"
      # render "psychology_tests/show"
    else
      questions.each do |question|
        Answer.create(user: current_user, question: question, point: params[:answer]["#{question.id}"])
      end
      redirect_to answer_path(session[:psychology_test_id]), notice: "回答を記録しました。"
    end
    # TODO: 完成後に消去。↓の書き方だとQuestionのSQLが無駄に発行される様子
    # question_ids = Question.where(personality: PsychologyTest.find(session[:psychology_test_id]).personalities).pluck(:id)
    # question_ids.each do |q_id|
    #   Answer.create(user: current_user, question_id: q_id, point: params[:answer]["#{q_id}"])
    # end
  end

  def show
    @psychology_test = PsychologyTest.find(session[:psychology_test_id])
  end
end
