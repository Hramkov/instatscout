class MatchesController < ApplicationController
  before_action :set_match, only: [:show, :edit, :update, :destroy]

  def index
    @matches = Match.all
    @teams = Team.all
  end

  def show
    @match = Match.find(params[:id])
    @home = Team.find(@match.home_team_id)
    @away = Team.find(@match.away_team_id)
  end

  def new
    @match = Match.new
    @teams = Team.all
  end

  def edit
  end

  def create
    @match = Match.new(match_params)
    # @team1 = Team.where(name: params[:match][:home_team][:name]).first_or_create
    # @team2 = Team.where(name: params[:match][:away_team][:name]).first_or_create

    # @match.teams << @team1
    # @match.teams << @team2
    # @match.home_team_id = @team1.id
    # @match.away_team_id = @team2.id

    respond_to do |format|
      if @match.save
        format.html { redirect_to @match, notice: 'Match was successfully created.' }
        format.json { render :show, status: :created, location: @match }
      else
        format.html { render :new }
        format.json { render json: @match.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @match.update(match_params)
        format.html { redirect_to @match, notice: 'Match was successfully updated.' }
        format.json { render :show, status: :ok, location: @match }
      else
        format.html { render :edit }
        format.json { render json: @match.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @match.destroy
    respond_to do |format|
      format.html { redirect_to matches_url, notice: 'Match was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_match
      @match = Match.find(params[:id])
    end

    def match_params
      params.require(:match).permit(:date, :value1, :value2, :home_team_id, :away_team_id)
    end
end
