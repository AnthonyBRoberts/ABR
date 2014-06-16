class VideosController < ApplicationController
  before_action :signed_in_user, only: [:create, :destroy]

  def index
    @videos = Video.order('created_at DESC')
  end

  def new
    @video = Video.new
  end

  def create
    @video = Video.new(video_params)
    if @video.save
      flash[:success] = 'Video added!'
      redirect_to '/videos#index'
    else
      render 'new'
    end
  end

  def destroy
    @video = Video.find(params[:id])
    if @video.present?
      @video.destroy
    end
    redirect_to '/videos#index'
  end

  private

    def video_params
      params.require(:video).permit(:link)
    end
end