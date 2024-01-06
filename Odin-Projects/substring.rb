# require 'pry-byebug'
# binding.pry

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

def substring(string, dictionary)
    result = Hash.new(0)
    lowered = string.downcase
    dictionary.each do |word|
        if lowered.include?(word)
            result[word] += 1
        end
    end
    result
end

puts substring("Howdy partner, sit down! How's it going?", dictionary)