class CardstatesController < ApplicationController
  before_action :set_cardstate, only: [:show, :edit, :update, :destroy]

  def study
  end



  # GET /cardstates
  # GET /cardstates.json
  def index
    @cardstates = Cardstate.all
  end

  # GET /cardstates/1
  # GET /cardstates/1.json
  def show
  end

  # GET /cardstates/new
  def new
    @cardstate = Cardstate.new
  end

  # GET /cardstates/1/edit
  def edit
  end

  # POST /cardstates
  # POST /cardstates.json
  def create
    @cardstate = Cardstate.new(cardstate_params)

    respond_to do |format|
      if @cardstate.save
        format.html { redirect_to @cardstate, notice: 'Cardstate was successfully created.' }
        format.json { render :show, status: :created, location: @cardstate }
      else
        format.html { render :new }
        format.json { render json: @cardstate.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cardstates/1
  # PATCH/PUT /cardstates/1.json
  def update
    respond_to do |format|
      if @cardstate.update(cardstate_params)
        format.html { redirect_to @cardstate, notice: 'Cardstate was successfully updated.' }
        format.json { render :show, status: :ok, location: @cardstate }
      else
        format.html { render :edit }
        format.json { render json: @cardstate.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cardstates/1
  # DELETE /cardstates/1.json
  def destroy
    @cardstate.destroy
    respond_to do |format|
      format.html { redirect_to cardstates_url, notice: 'Cardstate was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cardstate
      @cardstate = Cardstate.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cardstate_params
      params.require(:cardstate).permit(:user_id, :card_id, :delay, :due)
    end
end
