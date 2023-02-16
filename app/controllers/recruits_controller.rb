class RecruitsController < ApplicationController
  before_action :set_recruit, only: %i[ show edit update destroy ]
  authorize_resource

  # GET /recruits or /recruits.json
  def index
    @recruits = Recruit.all
    @labels = Label.all

    if params[:label_id]
      @recruits = Label.find(params[:label_id]).recruits
    else
      @recruits = Recruit.includes(:skiresort, :labels).all
    end
  end

  # GET /recruits/1 or /recruits/1.json
  def show
    @recruit = Recruit.includes(:skiresort, :labels).find(params[:id])
  end

  # GET /recruits/new
  def new
    @recruit = Recruit.new
    @labels = Label.all
  end

  # GET /recruits/1/edit
  def edit
    @recruit = Recruit.find(params[:id])
  end

  # POST /recruits or /recruits.json
  def create
    @recruit = Recruit.new(recruit_params)

    respond_to do |format|
      if @recruit.save
        format.html { redirect_to recruit_url(@recruit), notice: "Recruit was successfully created." }
        format.json { render :show, status: :created, location: @recruit }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @recruit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /recruits/1 or /recruits/1.json
  def update
    respond_to do |format|
      if @recruit.update(recruit_params)
        format.html { redirect_to recruit_url(@recruit), notice: "Recruit was successfully updated." }
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
      format.html { redirect_to recruits_url, notice: "Recruit was successfully destroyed." }
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
end
