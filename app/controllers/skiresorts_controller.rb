class SkiresortsController < ApplicationController
  def new
    @skiresort = Skiresort.new
  end

  def index

  end

  def create
    @skiresort = Skiresort.new(skiresort_params)

    @skiresort.save
  end

  def destroy
  end

  private

  def skiresort_params
    params.require(:skiresort).permit(:name, :address)
  end
end
