module SessionsHelper
    
    def addnewcards
        @user ||= @current_user
        #Check if user has studied today yet, if not update lastreviewed
        @user.update_attribute(:lastreviewed, Date.today)

        #Determine how many new cards need to be added
        #This isn't working, if there are any existing new cards in the users cardstates, it enters every single card to their cardstates for some reason. Non-essential feature, can fix later
        # newcardsneeded = 6
        # @user.cardstates.each do |card|
            # if card.due.nil?
            # newcardsneeded = newcardsneeded - 1
            # end
        # end
        # if newcardsneeded < 0
            # newcardsneeded = 0
        # end

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
        newcardstoadd = unreviewedcards.shuffle[0..5]

        #Add cardstates for the new cards to the user
        newcardstoadd.each do |card|
            newcards = Cardstate.new
            newcards.user_id = @user.id
            newcards.card_id = card
            newcards.save
        end
    end

    def setnextcard
        #Setting the next card
        @user ||= @current_user
        @cardsforreview = []
        @user.cardstates.each do |cardstate|
            if cardstate.due.nil? || cardstate.due <= Date.today
                @cardsforreview.push(cardstate)
            end
        end
        if @cardsforreview.empty? 
            @currentcard = {}
        else
            nextcardstate = @cardsforreview.sample
            nextcard = nextcardstate.card
            ar = [nextcard.term_a,nextcard.term_b].shuffle
            @currentcard = {"first_term" => ar[0], "second_term" => ar[1], "cardstate_id" => nextcardstate.id}
        end
    end


    def log_in(user)
        session[:user_id] = user.id
    end

    def current_user
        if session[:user_id]
          @current_user ||= User.find_by(id: session[:user_id])
        end
    end

    def logged_in?
        !current_user.nil?
    end

    def current_user?(user)
        user == current_user
    end

    def log_out
        session.delete(:user_id)
        @current_user = nil
    end


end
