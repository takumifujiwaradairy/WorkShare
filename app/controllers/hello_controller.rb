class HelloController < ApplicationController
  def index
    @tweets = Tweet.all
    @tweet = Tweet.new
  end

  def create
    Tweet.create(tweet_params)
    @tweets = Tweet.all
  end

  private
  def tweet_params
      params.require(:tweet).permit(:title,:tantou,:body)
  end
end
