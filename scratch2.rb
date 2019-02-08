@cardstate = {}
def function
    if @cardstate["due"].nil? && @cardstate["delay"].nil?
        @cardstate["delay"] = 1
        #@cardstate.save
    else @cardstate["due"].nil? && !@cardstate["delay"].nil?
        @cardstate["delay"] *= 2
        @cardstate["due"] = Date.today + @cardstate["delay"]
        #@cardstate.save
    end
    puts "due is #{@cardstate["due"]}"
    puts "delay is #{@cardstate["delay"]}"
end

5.times function()