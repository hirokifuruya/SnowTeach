# app/controllers/labels_controller.rb
class LabelsController < ApplicationController
  def create
    @label = Label.new(label_params)

    if @label.save
      flash[:success] = "ラベルを作成しました。"
      redirect_to recruits_path
    else
      flash.now[:error] = "ラベルの作成に失敗しました。"
      render :new
    end
  end

  private

  def label_params
    params.require(:label).permit(:name)
  end
end

