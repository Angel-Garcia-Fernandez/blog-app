class MyPostsController < ApplicationController

  # GET /my_posts
  # GET /my_posts.json
  def index
    @draft = current_user.posts.draft.includes(:comments)
    @published = current_user.posts.published.includes(:comments)
  end
end
