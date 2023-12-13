class FollowsController < ApplicationController
  before_action :set_follow, only: %i[show edit update destroy]

  def index
    @follows = Follow.all
    authorize @follows
  end

  def show
  end

  def new
    @follow = Follow.new
  end

  def edit
  end

  def create
    @follow = authorize current_user.following.new(follow_params)

    respond_to do |format|
      if @follow.save
        format.html { redirect_to book_url(@follow.book_id), notice: "Follow was successfully created." }
        format.json { render :show, status: :created, location: @follow }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @follow.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @follow.update(follow_params)
        format.html { redirect_to follow_url(@follow), notice: "Follow was successfully updated." }
        format.json { render :show, status: :ok, location: @follow }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @follow.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @follow.destroy

    respond_to do |format|
      format.html { redirect_to follows_url, notice: "Follow was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def set_follow
    @follow = authorize Follow.find(params[:id])
  end

  def follow_params
    params.require(:follow).permit(:book_id, :user_id)
  end
end
