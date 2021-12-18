class DiariesController < ApplicationController
  before_action :set_diary, only: %i[show edit update destroy]
  before_action :correct_user, only: %i[edit destroy update]

  # GET /diaries or /diaries.json
  def index
    @diaries = Diary.all
  end

  # GET /diaries/1 or /diaries/1.json
  def show; end

  # GET /diaries/new
  def new
    @diary = current_user.diaries.build
  end

  # GET /diaries/1/edit
  def edit; end

  # POST /diaries or /diaries.json
  def create
    @diary = current_user.diaries.build(diary_params)

    respond_to do |format|
      if @diary.save
        format.html do
          redirect_to @diary, notice: 'Diary was successfully created.'
        end
        format.json { render :show, status: :created, location: @diary }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json do
          render json: @diary.errors, status: :unprocessable_entity
        end
      end
    end
  end

  # PATCH/PUT /diaries/1 or /diaries/1.json
  def update
    respond_to do |format|
      if @diary.update(diary_params)
        format.html do
          redirect_to @diary, notice: 'Diary was successfully updated.'
        end
        format.json { render :show, status: :ok, location: @diary }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json do
          render json: @diary.errors, status: :unprocessable_entity
        end
      end
    end
  end

  # DELETE /diaries/1 or /diaries/1.json
  def destroy
    @diary.destroy
    respond_to do |format|
      format.html do
        redirect_to diaries_url, notice: 'Diary was successfully deleted.'
      end
      format.json { head :no_content }
    end
  end

  def correct_user
    @diary = current_user.diaries.find_by(id: params[:id])
    if @diary.nil?
      redirect_to root_path, notice: 'You are not allowed to do it.'
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_diary
    @diary = Diary.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def diary_params
    params.require(:diary).permit(:title, :feeling, :text, :user_id)
  end
end
