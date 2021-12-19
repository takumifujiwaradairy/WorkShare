# frozen_string_literal: true

class TweetsController < ApplicationController
  before_action :authenticate_user!
  def index
    @tweets = Tweet.order('date')
    @tweet = Tweet.new
    @q = Tweet.ransack(params[:q])
    @boards = @q.result.page(params[:page]).per(10)
  end

  def create
    @tweet = current_user.tweets.create!(tweet_params)
    @tweet.user_uid = current_user.uid
    @tweet.save
    @tweets = Tweet.order('date')
    @q = Tweet.ransack(params[:q])
    @boards = @q.result.page(params[:page]).per(10)
  end

  def show
    @tweet = Tweet.find(params[:id])
    @comments = @tweet.comments
    @comment = Comment.new
  end

  def edit
    @tweet = Tweet.find(params[:id])
  end

  def update
    @tweet = Tweet.find(params[:id])
    if @tweet.update(tweet_params)
      redirect_to tweets_path(@tweet), notice: '対応ステータスを更新しました'
    else
      render :show
    end
  end

  def destroy
    tweet = Tweet.find(params[:id])
    tweet.destroy 
    redirect_to tweets_path
  end

  private

  def tweet_params
    params.require(:tweet).permit(:title, :tantou, :body, :time, :completed)
  end
end
