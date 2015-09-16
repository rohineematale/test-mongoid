class QuestionsController < ApplicationController

  before_filter :set_question, only: [:edit, :update]

  def index
  end

  def new
  end

  def create
    @question = Question.new(question_params)
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
      params.require(:question).permit(:qText, :qType, :qAns, :lang)
    end

    def set_question
      @question = Question.find(params[:id])
    end
end
