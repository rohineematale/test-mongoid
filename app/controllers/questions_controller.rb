class QuestionsController < ApplicationController

  before_filter :set_question, only: [:edit, :update]

  def index
    @questions = current_owner.questions.order('created_at DESC').page(params[:page]).per(10)
  end

  def new
  end

  def create
    @question = current_owner.questions.build(question_params)
    @question.owner_id = current_owner.id
    @question.save
  end

  def show
  end

  def edit
  end

  def update
    @question.update_attributes(question_params)
  end

  def destroy
  end


  private
    def question_params
      params.require(:question).permit(:qText, :qType, :qAns, :lang, :owner_id)
    end

    def set_question
      @question = Question.find(params[:id])
    end
end
