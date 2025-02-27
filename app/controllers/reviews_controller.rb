class ReviewsController < ApplicationController
  before_action :set_movie
  before_action :authenticate_user!

  def new
    @review = @movie.reviews.build
  end

  def create
    @review = @movie.reviews.build(review_params)
    @review.user = current_user
    if @review.save
      redirect_to @movie, notice: "Review added successfully!"
    else
      redirect_to @movie, alert: "Review could not be added."
    end
  end

  private

  def set_movie
    @movie = Movie.find(params[:movie_id])
  end

  def review_params
    params.require(:review).permit(:rating, :comment)
  end
end