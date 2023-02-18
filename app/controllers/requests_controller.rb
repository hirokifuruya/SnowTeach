class RequestsController < ApplicationController
  def new
    if current_user.role_id == 3
      redirect_to recruits_path, alert: "You are not authorized to access this page."
    else
      @request = current_user.requests.build(date: params[:date], recruit_id: params[:recruit_id])
    end
  end

  def index
    if current_user.role_id == 3
      redirect_to recruits_path, alert: "You are not authorized to access this page."
    else
      @requests = Request.all
    end
  end

  def show
    @request = Request.find(params[:id])
    if @request.nil?
      flash[:error] = "リクエストが見つかりませんでした。"
      redirect_to requests_path
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
      if current_user.role_id == 3
        redirect_to recruits_path
      else
        redirect_to requests_path
      end
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

