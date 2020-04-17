class TopController < ApplicationController
  def index
    if params[:number] = nil
      @recruit_players = RecruitPlayer.where('place LIKE(?)', "%#{params[:place]}%").where(number: params[:number]).order("start_time").page(params[:page]).per(5)
    else
      @recruit_players = RecruitPlayer.where('place LIKE(?)', "%#{params[:place]}%").order("start_time").page(params[:page]).per(5)
    end
  end
end
