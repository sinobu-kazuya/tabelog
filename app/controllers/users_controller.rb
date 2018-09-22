class UsersController < ApplicationController
  before_action :set_user

  def index
  end

  def show
    @reviews = @user.reviews.order('visit_day DESC')
    shop = Shop.joins(:prefectures).where(prefectures: { id: [1...47]}).select('shops.*, prefectures.name').attributes
    shop = Shop.includes(:prefectures).select('shops.*, prefectures.name').first.attributes
    @review_ranks = @user.reviews.order('rate DESC')
    binding.pry
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to action: 'show'
    else
      redirect_to action: 'edit'
    end
  end

  private
  def user_params
    params.require(:user).permit(:nickname, :avatar, :background_image)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
