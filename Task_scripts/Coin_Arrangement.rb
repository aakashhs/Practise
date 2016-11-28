$no_of_arrangements = 0
def count(coin, change, amount)
	if amount == 0
		return 1
	elsif amount < 0
		return 0
	elsif change <= 0 && amount >= 1
		return 0
	else
		return count(coin , change - 1, amount) + count(coin , change , amount - coin[change-1])
	end
end
ARGV.each{ |line|
coin = Array.new
begin
	amount_and_coins = line.split(' ')
	amount = amount_and_coins[0].to_i
	change = amount_and_coins[1].to_i
	list = gets.chomp
	k = 0
	list.each_char do |c|
		if c != ' ' 
			coin[k] = c.to_i
			k += 1
		end
	end
	$no_of_arrangements = count(coin, change, amount)
	puts $no_of_arrangements
rescue 
	puts "invalid input"
	next
end
}
