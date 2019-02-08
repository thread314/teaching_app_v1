#These lines unnecessary
@cardstate = Cardstate.first
params = {"answer" => 36}


#start from here
d = Card.find(@cardstate.card_id) 
puts d

=begin 
correct_answer = d["term_a"] * d["term_b"]
#If user got the answer right
if params["answer"] == correct_answer
    if @cardstate.delay.nil?
        @cardstate.delay = 0.5
        @cardstate.save
    else
        @cardstate.delay *= 2
        puts "delay is #{@cardstate.delay}"
        @cardstate.due = Date.today + @cardstate.delay
        puts "due is #{@cardstate.due}"
        @cardstate.save
    end
#If user did not get the answer right
else
    puts "the answer was wrong"
    @cardstate.due = ""
    @cardstate.delay = ""
    @cardstate.save
end
 =end

=begin 
#DELETE THIS LINE!! - FOR SCRATCH ONLY
@user = User.first


a = @user
cardsforreview = []
a.cardstates.each do |cardstate|
    if cardstate.due.nil? || cardstate.due <= Date.today
        cardsforreview.push(cardstate)
    end
end
if cardsforreview.empty? 
    @currentcard = {}
else
    nextcardstate = cardsforreview.sample
    nextcard = nextcardstate.card
    ar = [nextcard.term_a,nextcard.term_b].shuffle
    @currentcard = {"first_term" => ar[0], "second_term" => ar[1], "correct_answer" => ar[0] * ar[1], "cardstate_id" => nextcardstate.id}
end
 =end





=begin
#Check if user has studied today yet, if not update lastreviewed
if @user.lastreviewed.nil? || @user.lastreviewed != Date.today
    @user.lastreviewed = Date.today
    @user.save

    #Determine how many new cards need to be added
    @user = User.first
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
=end


=begin 
#The function to put together the array of cards for review
a = User.first
cardsforreview = []
a.cardstates.each do |card|
    if card.due.nil? || card.due <= Date.today
        cardsforreview.push(card)
    end
end
 =end


 =begin 
This was the function to create the times table
a = (2..12).to_a
b = (2..12).to_a
a.each do |term_a|
    b.each do |term_b|
        if term_a <= term_b
            u = Card.create(term_a: term_a, term_b: term_b)
            #puts "#{term_a} and #{term_b}"
        end
    end
end
=end

