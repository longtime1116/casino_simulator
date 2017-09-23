FIRST_BET = 50
MAX_BET = 3000
TIGHT_BUDGET = false

# 勝敗表(小に賭けた場合)
# 3 : lose
# 4-10 : win
# 11-17 : lose
# 18 : lose
# よって、17/36 の確率で勝てる
def win?
  val = @random.rand(36) + 1
  return true if val < 18
  false
end

def next_bet_martingale(bet, money, result)
  next_bet_val = bet * 2
  next_bet_val =  MAX_BET if next_bet_val > MAX_BET
  return money + result if money + result < next_bet_val
  next_bet_val
end


def next_bet_dalembert(bet, money, result)
  next_bet_val = bet + 1
  next_bet_val =  MAX_BET if next_bet_val > MAX_BET
  return money + result if money + result < next_bet_val
  next_bet_val
end

try_count = ARGV[0].to_i
money = ARGV[1].nil? ? 5000 : ARGV[1].to_i
@random = Random.new
bet = FIRST_BET
result = 0
bunkrupted_count = 0

puts "You play #{try_count} times. Your Money is #{money}"
try_count.times do

  if win?
    puts "win  : #{bet}"
    result += bet
    puts "result : #{result}"
    bet = FIRST_BET
    next
  end

#  puts "lose : #{-bet}"
  result -= bet
  puts "result : #{result}"

  if money + result <= 0
    if TIGHT_BUDGET
      puts "!!! Go home !!!"
      exit 0
    end
    bunkrupted_count += 1
    puts "!!! bunkrupted(#{bunkrupted_count}) !!!"
    bet = FIRST_BET
    result = 0
    next
  end
  bet = bet == MAX_BET ? FIRST_BET : next_bet_martingale(bet, money, result)
  #bet = bet == MAX_BET ? FIRST_BET : next_bet_dalembert(bet, money, result)
end

result = result - bunkrupted_count * money
puts "RESULT : #{result}(#{bunkrupted_count} times bunkrupted)"
