class RequestsController < ApplicationController
  def new
    @request = Request.new
  end

  def index

  end

  def create
    @request = Request.new(request_params)

    @request.save
  end

  def destroy
  end

  private

  def request_params
    params.require(:request).permit(:date, :status)
  end
end
