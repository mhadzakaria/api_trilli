class Api::V1::CardsController < ApplicationController
  before_action :set_card, only: [:show, :update, :destroy, :add_team, :rem_team]
  before_action :set_team, only: [:add_team, :rem_team]
  # GET /cards
  def index
    @cards = Card.all

    render json: @cards
  end

  # GET /cards/1
  def show
    render json: @card
  end

  # POST /cards
  def create
    @card = Card.new(card_params)

    if @card.save
      render json: @card, status: :created
    else
      render json: @card.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /cards/1
  def update
    if @card.update(card_params)
      render json: @card
    else
      render json: @card.errors, status: :unprocessable_entity
    end
  end

  def add_team
    @card.teams << @team
    render json: @card, status: :created
  end

  def rem_team
    @card.teams = @card.teams.select{|t| !t.eql?(@team)}
    render json: @card, status: :created
  end

  # DELETE /cards/1
  def destroy
    @card.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_card
      @card = Card.find(params[:id])
    end

    def set_team
      @team = Team.find(params[:team_id])
    end

    # Only allow a trusted parameter "white list" through.
    def card_params
      params.require(:card).permit(:title, :list_id)
    end
end
