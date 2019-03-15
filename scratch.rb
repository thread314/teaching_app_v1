@user = User.last
#Determine how many new cards need to be added
#This isn't working, if there are any existing new cards in the users cardstates, it enters every single card to their cardstates for some reason. Non-essential feature, can fix later
newcardsneeded = 6
@user.cardstates.each do |card|
    if card.due.nil?
    newcardsneeded = newcardsneeded - 1
    end
end
if newcardsneeded < 0
    newcardsneeded = 0
end
puts "here tis- #{newcardsneeded}"
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
        newcardstoadd = unreviewedcards.shuffle[0..newcardsneeded]
puts newcardstoadd
