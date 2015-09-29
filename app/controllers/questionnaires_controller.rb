class QuestionnairesController < ApplicationController
	before_filter :set_questionnaire, only: [:show, :edit, :update]

  def index
    @questionnaires = current_owner.questionnaires.order('created_at DESC').page(params[:page]).per(10)
  end

  def newm
  end

  def create
    @questionnaire = current_owner.questionnaires.build(questionnaire_params)
    @questionnaire.owner_id = current_owner.id
    @questionnaire.save
  end

  def show
  end

  def edit
  end

  def update
    respond_to do |format|
      if @questionnaire.update_attributes(questionnaire_params)
        format.html { redirect_to questionnaires_path, notice: 'Questions added successfully' }
        format.js
      else
        format.html { render :show }
        format.js
      end
    end
  end

  def destroy
  end


  private
    def questionnaire_params
      params.require(:questionnaire).permit(:name, :desc, :owner_id, :display, :questions => [])
    end

    def set_questionnaire
      @questionnaire = Questionnaire.find(params[:id])
    end

end
