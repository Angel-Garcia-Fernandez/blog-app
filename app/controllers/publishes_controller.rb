class PublishesController < ApplicationController
  before_action :set_post

  # POST /publishes
  # POST /publishes.json
  def create
    @post.publish

    respond_to do |format|
      if @post.save
        format.html { redirect_to my_posts_path, notice: 'Post was successfully published.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { redirect_to my_posts_path, notice: 'Could not publish post successfully.' }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:post_id])
    end
end
