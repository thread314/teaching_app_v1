#Check if user has studied today yet, if not update lastreviewed
@user = User.last
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
    
    puts "Here they are!"
    puts newcardstoadd

=begin     #Add cardstates for the new cards to the user
    newcardstoadd.each do |card|
        newcards = Cardstate.new
        newcards.user_id = @user.id
        newcards.card_id = card
        newcards.save
    end 
=end

end



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

