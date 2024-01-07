# require 'pry-byebug'
# binding.pry

def stock_pick(array)
    min = 0
    max = 0
    profit = 0
    array.each_with_index do |buy, buy_index|       #Grab the buy price and index
        array.each_with_index do |sell, sell_index| #Grab the sell price and index
            if sell_index > buy_index               #Only compare if the sell price is after the buy price, since we have to buy first
                if sell - buy > profit              #If the profit is greater than the previous profit, update the min, max, and profit
                    min = buy_index
                    max = sell_index
                    profit = sell - buy
                end
            end
        end
    end
    return [min, max]
end

puts stock_pick([17,3,6,9,15,8,6,1,10])