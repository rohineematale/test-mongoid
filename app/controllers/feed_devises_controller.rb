class FeedDevisesController < ApplicationController
	before_filter :set_feed_devise, only: [:show, :edit, :update, :cancel]

  def index
    @feed_devises = current_owner.feed_devises.order('created_at DESC').page(params[:page]).per(10)
  end

  def newm
  end

  def create
    @feed_devise = current_owner.feed_devises.build(feed_devise_params)
    @feed_devise.owner_id = current_owner.id
    @feed_devise.save
  end

  def show
  end

  def edit
  end

  def update
    respond_to do |format|
      if @feed_devise.update_attributes(feed_devise_params)
        format.html { redirect_to feed_devises_path, notice: 'Feed Devise added successfully' }
        format.js
      else
        format.html { render :show }
        format.js
      end
    end
  end

  def cancel
  end

  def destroy
  end


  private
    def feed_devise_params
      params.require(:feed_devise).permit(:name, :password, :location, :owner_id, :questionnaires => [])
    end

    def set_feed_devise
      @feed_devise = FeedDevise.find(params[:id])
    end
end
