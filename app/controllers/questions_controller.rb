class QuestionsController < ApplicationController
  before_action :set_question, only: %i[show edit update destroy hide]
  def create
    @question = Question.create(question_params)
    redirect_to question_path(@question), notice: 'Ваш вопрос создан!/QUESTION CREATED'
  end
  def update
    @question = Question.update(question_params)
    redirect_to question_path(@question), notice: 'Вопрос обновили!/QUESTION EDITED'
  end
  def destroy
    @question.destroy
    redirect_to questions_path, notice: 'Вопрос удалён!/QUESTION DELETED'
  end

  def show
  end
  def index
    @questions = Question.all
    @question = Question.new

  end

  def new
    @question = Question.new
  end
  def edit
    @question = Question.find(params[:id])
  end

  def hide
    @question.update(hidden: true)
    redirect_to questions_path
  end

  private

  def question_params
    params.require(:question).permit(:body, :user_id)
  end

  def set_question
    @question = Question.find(params[:id])
  end
end
