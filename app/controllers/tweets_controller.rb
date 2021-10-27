class TweetsController < ApplicationController
 
  def index
    @tweets = Tweet.all
    @tweet = Tweet.new
  end

  def create
    Tweet.create(tweet_params)
    @tweets = Tweet.all
  end

  def show
    @tweet = Tweet.find(params[:id])
  end

  def destroy
    tweet = Tweet.find(params[:id])
    tweet.destroy
    redirect_to tweets_path
  end

  private
  def tweet_params
      params.require(:tweet).permit(:title,:tantou,:body)
  end
end
