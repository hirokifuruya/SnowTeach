class RequestsController < ApplicationController
  def new
    @request = Request.new
  end

  def index
    @requests = Request.all
  end

  def show
    @request = Request.find(params[:id])
  end

  def create
    #@request = Request.new(request_params)
    @recruit = Recruit.find(1)
    @request = current_user.requests.build(request_params)
    @request.recruit_id = @recruit.id
    @request.save
    redirect_to requests_path
  end

  def destroy
  end

  private

  def request_params
    params.require(:request).permit(:date, :status, :recruit_id)
  end
end
