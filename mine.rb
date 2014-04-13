
@i = 0
def board(game)
  out = []
  game[0].to_i.times do
    out << []
    game[1].to_i.times do
      out.last << '.'
    end
  end
  # out[-1][-1] = 'c' if out[-1][-1] && out[-1] != nil
  # out[-1][-2] = 'x' if out[-1][-2] &&  out[-1] != nil
  # out[-2][-2] = 'x' if  out[-2][-2] && out[-2] != nil
  # out[-2][-1] = 'x' if  out[-2][-1] && out[-2] != nil
  @board = out
end

def pgame(board)
  board.map {|e| e.join(" ") }.join"\n"
end


def cell(x,y)
  @board[x][y]
end

def safe?(x,y)

  tries = []
  tries << @board[x][y]
  tries << @board[x+1][y]
  tries << @board[x][y+1]
  tries << @board[x-1][y]
  tries << @board[x][y-1]
  tries << @board[x+1][y+1]
  tries << @board[x+1][y-1]
  tries << @board[x-1][y+1]
  tries << @board[x-1][y-1]

   !tries.include?("*")

end

def makeboard(game)
  mines = game[2]
  board = board(game)

  board.map! do |a|
    a.map! do |e|
      if mines > 0 && e != 'x' && e != 'c'
        mines -= 1
        '*'
      else
        e
      end
    end
  end
  board << mines


end

def try(board)
  mines = board.pop
  if mines != 0
    "Impossible!"
  else
    change = nil
    board.each do |this|

      if change
        this[0] = '*' if this[0] != 'c'
        change = nil
      end

      if this.count("*") == this.size - 1
        this[-2] = "." if this[-2]
        change = true
      end
    end
    pgame board.map {|a|a.map{|e|e =='x'?'.':e}}
    # pgame board.map
  end
end



input = File.read("test.txt").split("\n")
input.shift
input.map! {|e| e.split.map {|e| e.to_f} }

print try(makeboard([7, 7, 7]))
puts
print makeboard([7, 7, 7])


# x = input.map! {|e| try e }
# y = []
# x.each_with_index do |v, i|
#   y << "Case #" + (i + 1).to_s + ":\n" + v.to_s + "\n"
# end
# system "clear"
# print y.join("\n")

# # File.open("outreal.txt", 'w') { |file| file.write(y.join("\n")) }
