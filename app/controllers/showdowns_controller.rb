class ShowdownsController < ApplicationController
  before_action :set_showdown, only: [:show, :edit, :update, :destroy, :vote]
  autocomplete :contestant, :name, :full => true

  # GET /showdowns
  # GET /showdowns.json
  def index
    redirect_to Showdown.all.sample
  end

  # GET /showdowns/1
  # GET /showdowns/1.json
  def show
    @contestants = @showdown.contestants
    @votes = @showdown.votes.group_by(&:contestant)
    @total_votes = @showdown.votes.count
    @stats = @showdown.stats
    @stats = @stats.map { |stat|
      { 
        @contestants.first => @contestants.first.stat_for(stat),
        :description => stat,
        @contestants.last => @contestants.last.stat_for(stat)
      }
    }
  end

  # POST /showdowns/1/vote
  def vote
    contestant = Contestant.find(params[:contestant_id])

    if Vote.where(showdown: @showdown, user: params[:username]).count > 0
      Vote.where(showdown: @showdown, user: params[:username]).first.update(contestant: contestant)
    else
      Vote.create(showdown: @showdown, contestant: contestant, user: params[:username])
    end

    return (@showdown.votes.group_by(&:contestant)).to_json
  end

  # GET /showdowns/new
  def new
    @showdown = Showdown.new
  end

  # GET /showdowns/1/edit
  def edit
  end

  # POST /showdowns
  # POST /showdowns.json
  def create
    @showdown = Showdown.new(showdown_params)
    if params.has_key?(:contestant)
      contestants = []
      params[:contestant].each_with_index do |contestant, index|
        if Contestant.where(name: contestant).count > 0
          contestants << Contestant.where(name: contestant).first
        else
          contestant = Contestant.create(name: contestant)
          contestant.portrait_url = JSON.parse(params["portrait#{index + 1}"])[0]['url']
          if contestant.save
            contestants << contestant
          end
        end
      end
      if params.has_key?(:stats)
        params[:stats].each do |index, stat_row|
          stat = Stat.create(showdown: @showdown, description: stat_row[:description])
          ContestantStat.create(stat: stat, value: stat_row[:contestant1], contestant: contestants.first)
          ContestantStat.create(stat: stat, value: stat_row[:contestant2], contestant: contestants.last)
        end
      end
      @showdown.contestants = contestants
    end

    respond_to do |format|
      if @showdown.save
        format.html { redirect_to @showdown, notice: 'Showdown was successfully created.' }
        format.json { render :show, status: :created, location: @showdown }
      else
        format.html { render :new }
        format.json { render json: @showdown.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /showdowns/1
  # PATCH/PUT /showdowns/1.json
  def update
    respond_to do |format|
      if @showdown.update(showdown_params)
        format.html { redirect_to @showdown, notice: 'Showdown was successfully updated.' }
        format.json { render :show, status: :ok, location: @showdown }
      else
        format.html { render :edit }
        format.json { render json: @showdown.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /showdowns/1
  # DELETE /showdowns/1.json
  def destroy
    @showdown.destroy
    respond_to do |format|
      format.html { redirect_to showdowns_url, notice: 'Showdown was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_showdown
      @showdown = Showdown.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def showdown_params
      params[:showdown]
    end
end
