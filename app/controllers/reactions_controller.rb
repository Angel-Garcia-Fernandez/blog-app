class ReactionsController < ApplicationController
  before_action :set_comment
  before_action :set_reaction, only: [:destroy]

  # POST /reactions
  # POST /reactions.json
  def create
    @reaction = @comment.reactions.build(reaction_params)
    @reaction.author = current_user

    respond_to do |format|
      if @reaction.save
        format.html { redirect_to @comment.post, notice: 'Reaction was successfully created.' }
        format.json { render :show, status: :created, location: @reaction }
      else
        format.html { redirect_to @comment.post, notice: 'Reaction was successfully created.' }
        format.json { render json: @reaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reactions/1
  # DELETE /reactions/1.json
  def destroy
    @reaction.destroy
    respond_to do |format|
      format.html { redirect_to @comment.post, notice: 'Reaction was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_comment
      @comment = Comment.find(params[:comment_id])
    end

    def set_reaction
      @reaction = Reaction.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def reaction_params
      params.require(:reaction).permit(:reaction_type)
    end
end
