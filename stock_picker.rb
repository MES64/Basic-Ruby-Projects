# frozen_string_literal: true

def stock_picker(prices)
  prices.each_with_index.reduce([0, 0]) do |pair, (todays_price, today)|
    sell_price = prices[today..].max
    profit = sell_price - todays_price
    max_profit = prices[pair[1]] - prices[pair[0]]
    pair = [today, today + prices[today..].find_index(sell_price)] if profit > max_profit
    pair
  end
end

p stock_picker([17, 3, 6, 9, 15, 8, 6, 1, 10])
p stock_picker([17, 3])
p stock_picker([17])
p stock_picker([])
