def caesar_encode(string, offset)
  num_let = {'z'=>0}
  ('a'..'y').zip(1..25) { |letter, number| num_let[letter] = number}
  letters = string.split('')
  num_let.each{ |let, num| 
  for i in 0..letters.length 
  if let.upcase == letters[i]
    letters[i] = "#{((num+offset)%26)}!àėrø" 
  elsif let == letters[i] 
    letters[i] = ((num+offset)%26)
  end end }
  for i in 0...letters.length
    if letters[i].is_a? Integer 
    letters[i]= num_let.keys[letters[i]]
    elsif letters[i].include?("!àėrø")
      letters[i] =  num_let.keys[(letters[i].tr("!àėrø", "")).to_i]
      letters[i] = letters[i].upcase
    end end 
    return letters.join end
def caesar_decode(string, offset)
  caesar_encode(string,offset*-1)
end
puts "What would you like to encode?"
user_string = gets.chomp
puts "What do you want the offset to be?"
user_offset = gets.chomp.to_i
puts caesar_encode(user_string,user_offset)