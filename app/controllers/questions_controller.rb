class QuestionsController < ApplicationController

  before_filter :set_question, only: [:edit, :update, :destroy]

  def index
    @questions = current_owner.questions.order('created_at DESC').page(params[:page]).per(10)
  end

  def new
    @question = current_owner.questions.build
  end

  def create
    @question = current_owner.questions.build(question_params)
    @question.owner_id = current_owner.id
    if @question.save
      @questions = current_owner.questions.order('created_at DESC').page(params[:page]).per(10)
    end
  end

  def show
  end

  def edit
  end

  def update
    @question.update_attributes(question_params)
  end

  def destroy
    # @question.destroy
    # @questions = current_owner.questions.order('created_at DESC').page(params[:page]).per(10)
  end


  private
    def question_params
      params.require(:question).permit(:qText, :qType, :lang, :owner_id, :qAnsText)
    end

    def set_question
      @question = current_owner.questions.find(params[:id])
    end
end
