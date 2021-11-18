class TweetsController < ApplicationController
  before_action :authenticate_user!
  def index
    @tweets = Tweet.all
    @tweet = Tweet.new
    @q = Tweet.ransack(params[:q])
    @boards = @q.result
  end

  def create
    current_user.tweets.create!(tweet_params)
    @tweets = Tweet.all
  end

  def show
    @tweet = Tweet.find(params[:id])
  end

  def update
    @tweet = Tweet.find(params[:id])
    if @tweet.update(tweet_params)
      redirect_to tweets_path(@tweet), notice: "対応ステータスを更新しました"
    else
      render :show, alert: "対応ステータスを更新できませんでした"
    end
  end

  def destroy
    tweet = Tweet.find(params[:id])
    tweet.destroy
    redirect_to tweets_path
  end

  private
  def tweet_params
      params.require(:tweet).permit(:title,:tantou,:body,:time,:completed)
  end
end
