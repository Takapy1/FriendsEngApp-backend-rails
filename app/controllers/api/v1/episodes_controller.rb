class Api::V1::EpisodesController < ApplicationController
  def index
    season_id = params[:season_id]
    season = Season.find(season_id)
    @episodes = season.episodes.order(:id)
    render json: { status: "SUCCESS", data: @episodes }
  end
  
  def show
    # @phrase = Phrase.new
    season_id = params[:season_id].to_i
    episodes = Season.find(season_id).episodes
    @episode = episodes.find(params[:id].to_i + Constants::CUL_SUM_NUM_EPISODES_LIST[season_id - 1])
    render json: { status: "SUCCESS", data: @episode.lines }
    # @dialogues = @episode.dialogues
    # @phrases_json = get_phrases_json(@dialogues)
  end

  def all_index
    render json: { status: 'success', data: Constants::NUM_EACH_EPISODE }
  end

  private

  def get_phrases_json(dialogues)
    phrases_list = {}
    dialogues.each do |dialogue|
      phrases_list[dialogue.id.to_s] = dialogue.phrases.to_a
    end
    phrases_list.to_json
  end
end
