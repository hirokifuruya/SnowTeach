class RecruitsController < ApplicationController
  before_action :set_recruit, only: %i[ show edit update destroy ]
  before_action :authenticate_user!
  before_action :check_ownership, only: [:edit, :update, :destroy]
  authorize_resource

  # GET /recruits or /recruits.json
  def index
    @recruits = Recruit.includes(:skiresort, :labels)

    if params[:search].present?
      @recruits = @recruits.where('name LIKE ?', "%#{params[:search]}%")
    end

    if params[:skiresort_id].present?
      @recruits = @recruits.where(skiresort_id: params[:skiresort_id])
    end

    if params[:label_ids].present?
      @recruits = @recruits.joins(:labels).where(labels: { id: params[:label_ids] }).distinct
    end
  end

  # GET /recruits/1 or /recruits/1.json
  def show
    @recruit = Recruit.includes(:skiresort, :labels).find(params[:id])
  end

  # GET /recruits/new
  def new
    @recruit = current_user.recruit.build
    @labels = Label.all
  end

  # GET /recruits/1/edit
  def edit
    @recruit = Recruit.find(params[:id])
    @labels = Label.all
  end

  # POST /recruits or /recruits.json
  def create
    @recruit = current_user.recruit.build(recruit_params)
    @labels = Label.all
    if @recruit.start_day.present? && @recruit.end_day.present? && @recruit.start_day > @recruit.end_day
      redirect_to new_recruit_path, alert: '開始日は終了日より前にしてください'
    else
      respond_to do |format|
        if @recruit.save
          format.html { redirect_to recruit_url(@recruit), notice: "正常に投稿されました。" }
          format.json { render :show, status: :created, location: @recruit }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @recruit.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PATCH/PUT /recruits/1 or /recruits/1.json
  def update
    respond_to do |format|
      if @recruit.update(recruit_params)
        format.html { redirect_to recruit_url(@recruit), notice: "正常に投稿が更新しました。" }
        format.json { render :show, status: :ok, location: @recruit }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @recruit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recruits/1 or /recruits/1.json
  def destroy
    @recruit.destroy

    respond_to do |format|
      format.html { redirect_to recruits_url, notice: "募集を削除しました。" }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recruit
      @recruit = Recruit.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def recruit_params
      params.require(:recruit).permit(:name, :money, :detail, :start_day, :end_day, :skiresort_id, label_ids: [])
    end

    def check_ownership
      recruit = Recruit.find(params[:id])
      unless recruit.user == current_user
        redirect_to recruits_path, alert: "他のユーザーの投稿は編集できません"
      end
    end
end


