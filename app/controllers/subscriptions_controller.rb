class SubscriptionsController < ApplicationController
	
	def new
  	@subscription = Subscription.new
  end

	def index
		@subscriptions = Subscription.all
	end

	def create
		@subscription = Subscription.new(subscription_params)
		if @subscription.save
			redirect_to @subscription
		else
      render action: 'new'
    end
  end

  def destroy
    @subscription = Subscription.find(params[:id])
  	@subscription.destroy
  	redirect_to root_path
  end

  def show
  	@subscription = Subscription.find(params[:id])
  end

   private

    def subscription_params
      params.require(:subscription).permit(:user_id, :course_id, :grade)
    end
end
