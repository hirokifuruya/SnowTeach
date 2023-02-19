class RequestsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  def new
    @request = current_user.requests.build(date: params[:date], recruit_id: params[:recruit_id])
  end

  def index
    @requests = Request.all
  end

  def show
    @request = Request.find(params[:id])
    if @request.nil?
      flash[:error] = "リクエストが見つかりませんでした。"
    end
  end

  def edit
    @request = Request.find(params[:id])
  end

  def update
    @request = Request.find(params[:id])
    if @request.update(request_params)
      redirect_to requests_path
    else
      render :edit
    end
  end

  def create
    @request = current_user.requests.build(request_params)
    if @request.valid?
      @request.save
      redirect_to requests_path
    else
      render :new
    end
  end

  def destroy
    @request = Request.find(params[:id])
    if @request.destroy
      flash[:success] = "予約が削除されました。"
    else
      flash[:error] = "予約を削除できませんでした。"
    end
    redirect_to requests_path
  end

  private

  def request_params
    params.require(:request).permit(:date, :status, :request_id, :recruit_id)
  end
end

