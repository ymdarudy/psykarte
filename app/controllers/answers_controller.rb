class AnswersController < ApplicationController
  def create
    questions = Question.where(personality: Personality.where(psychology_test_id: params[:answer][:psychology_test_id]))
    if questions.count != (params[:answer]&.keys&.size - 1)
      redirect_to request.referrer, alert: "未回答の設問がありました。すべて回答してください。"
    else
      questions.each do |question|
        Answer.create(user: current_user, question: question, point: params[:answer]["#{question.id}"])
      end
      redirect_to answer_path(params[:answer][:psychology_test_id]), notice: "回答を記録しました。"
    end
  end

  def show
    @user = current_user
    @user = User.find(params[:user_id]) if params[:user_id]
    @psychology_test = PsychologyTest.find(params[:id])

    return unless @user.answers.scoped_by_psychology_test(@psychology_test).size == 0
    redirect_to user_path(@user), alert: "その心理テストはまだ一度も回答していません。"
  end
end
