class MatchingController < ApplicationController

  def new
    @matching = matching.new
  end

  def index

  end

  def create
    @matching = matching.new(matching_params)

    @matching.save
  end

  def destroy
  end

  private

  def matching_params
    params.require(:matching).permit(:status)
  end
end
