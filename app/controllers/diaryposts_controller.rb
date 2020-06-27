class DiarypostsController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:destroy]
  
  def create
    @diarypost = current_user.diaryposts.build(diarypost_params)
    if @diarypost.save!
      flash[:success] = '日記を投稿しました。'
      redirect_to root_url
    else
      flash.now[:danger] = '日記の投稿に失敗しました。'
      render 'toppages/index'
    end
  end

  def destroy
    @diarypost.destroy
    flash[:success] = '日記を削除しました。'
    redirect_back(fallback_location: root_path)
  end

  private
  
  def diarypost_params
    params.require(:diarypost).permit(:content, :title, :picture)
  end

  def correct_user
    @diarypost = current_user.diaryposts.find_by(id: params[:id])
    unless @diarypost
      redirect_to root_url
    end
  end
end
