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
        PostRelayJob.perform_later(@comment.post, current_user)
        format.html { redirect_to @comment.post, notice: 'Reaction was successfully created.' }
        format.json { render :show, status: :created, location: @reaction }
      else
        format.html { redirect_to @comment.post, notice: 'Reaction counldn\'t be created.' }
        format.json { render json: @reaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reactions/1
  # DELETE /reactions/1.json
  def destroy
    if @reaction.present?
      @reaction.destroy
      PostRelayJob.perform_later(@comment.post, current_user)
      respond_to do |format|
        format.html { redirect_to @comment.post, notice: 'Reaction was successfully destroyed.' }
        format.json { head :no_content }
      end
    else
      respond_to do |format|
        format.html { redirect_to @comment.post, notice: 'Reaction was already destroyed.' }
      end
    end
  end

  private
    def set_comment
      @comment = Comment.find(params[:comment_id])
    end

    def set_reaction
      @reaction = Reaction.find_by(id: params[:id])
    end

    # Only allow a list of trusted parameters through.
    def reaction_params
      params.require(:reaction).permit(:reaction_type)
    end
end
