class ReservesController < ApplicationController


  def new
    @reserve = Reserve.new
    @recruit = Recruit.first
  end

  def index

  end

  def create
    @reserve = Reserve.new(reserve_params)

    @reserve.save
  end

  def destroy
  end

  private

  def reserve_params
    params.require(:reserve).permit(:date, :recruit_id)
  end

end

