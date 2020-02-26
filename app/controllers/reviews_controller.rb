class ReviewsController < ApplicationController
  before_action :authenticate_user!
  skip_before_action :authenticate_user!, only: [:index, :show]

  def new
    @review = Review.new
    authorize @review
  end

  def create
    @review = Review.new(review_params)
    authorize @review
    @user = current_user
    @review.user = @user

    if @review.save
      redirect_to booking_path(@booking)
    else
      render :new
    end
  end

  def edit
    @review = Review.find(params[:id])
    authorize @review
    @status_message = @review.status.to_i == 1 ? 'Payment Pending' : 'Confirmed'
  end

  def update
    @review = Review.find(params[:id])
    authorize @review
    if @review.update(review_params)
      redirect_to booking_path(@review)
    else
      render :edit
    end
  end

  def destroy
    @review = Review.find(params[:id])
    authorize @review
    @review.destroy
    redirect_to dashboard_path
  end

  private

  def review_params
    params.require(:review).permit(:start, :end, :venue_id)
  end

end
