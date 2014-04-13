input = File.read("go2").split("\n")
input.shift
input.map! {|e| e.split.map {|e| e.to_f} }

def solve_game(game)
  c = game[0]
  f = game[1]
  x = game[2]

  prod = 2.0
  total_time = 0.0

  time_to_farm = c / prod
  time_to_win = x / prod

  until time_to_win < time_to_farm + (x / (prod + f)) do
    total_time += time_to_farm
    prod += f
    time_to_farm = c / prod
    time_to_win = x / prod
  end
  return total_time += time_to_win
end

x = input.map {|e| solve_game(e) }

y = []
x.each_with_index do |v, i|
  y << "Case #" + (i + 1).to_s + ": " + v.round(7).to_s
end

print y.join("\n")
# File.open("cookieout2.txt", 'w') { |file| file.write(y.join("\n")) }
