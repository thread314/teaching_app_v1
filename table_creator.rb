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
