# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    tweet = Tweet.find(params[:tweet_id])
    comment = tweet.comments.build(comment_params)
    comment.user_id = current_user.id
    flash[:success] = if comment.save
                        'コメントしました'
                      else
                        'コメントできませんでした'
                      end
    redirect_back(fallback_location: root_path)
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
