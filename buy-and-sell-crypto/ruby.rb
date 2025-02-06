# @param {Integer[]} prices
# @return {Integer}
def max_profit1(prices)
    left, right = 0, 1
    max_profit = 0

    while right < prices.size
        buy_price, sell_price = prices[left], prices[right]
        if buy_price < sell_price
            profit = sell_price - buy_price
            max_profit = profit if profit > max_profit
        else
            left = right
        end
        right += 1
    end

    max_profit
end

def max_profit2(prices)
    min_price, max_profit = prices[0], 0
    prices[1..].each do |price|
      min_price = [min_price, price].min
      max_profit = [max_profit, price - min_price].max
    end
    max_profit
end
