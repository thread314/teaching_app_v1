class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
    #Check if user has studied today yet, if not update lastreviewed
    if @user.lastreviewed.nil? || @user.lastreviewed != Date.today
        @user.lastreviewed = Date.today
        @user.save

        #Determine how many new cards need to be added
        #@user = User.first
        newcardsneeded = 6
        @user.cardstates.each do |card|
            if card.due.nil?
            newcardsneeded = newcardsneeded - 1
            end
        end
        if newcardsneeded < 0
            newcardsneeded = 0
        end

        #Fetch the new cards to be added
        currentcardsarray = []
        @user.cardstates.each do |card|
            currentcardsarray.push(card.card_id)
        end
        allcardsarray = []
        Card.all.each do |card|
            allcardsarray.push(card.id)
        end
        unreviewedcards = []
        unreviewedcards = allcardsarray - currentcardsarray
        newcardstoadd = unreviewedcards.shuffle[0..newcardsneeded-1]

        #Add cardstates for the new cards to the user
        newcardstoadd.each do |card|
            newcards = Cardstate.new
            newcards.user_id = @user.id
            newcards.card_id = card
            newcards.save
        end
    end

    #
    a = @user
    @cardsforreview = []
    a.cardstates.each do |card|
      if card.due.nil? || card.due <= Date.today
          @cardsforreview.push(card)
      end
    end
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to users_path, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to users_path, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :email, :lastreviewed)
    end
end
