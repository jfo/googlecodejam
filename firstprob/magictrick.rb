require 'set'

input = File.read("again").split("\n")

def solve(input)

  rounds = input.shift.to_i

  tables = []
  rounds.times do
    2.times do
    tables << []
    5.times do
      tables.last << input.shift
    end
    end
  end

  def setter(table)
    table[table[0].to_i]
  end

  p tables
  tables.map! {|t| setter(t)}


  p tables

  def compare(all)
    wins = []
    until all.length == 0
      a = all.shift
      a = a.split().map {|e| e.to_i}
      b= all.shift
      b = b.split().map {|e| e.to_i}
      c = a & b
      wins << c
    end
    wins
  end
  compare(tables).map do |e|
    if e.length == 1
      e.first
    elsif e.length > 1
      "Bad magician!"
    elsif e.length == 0
      "Volunteer cheated!"
    end
  end
end

x = solve(input)
y = []
 x.each_with_index do |v, i|
  y << "Case #" + (i + 1).to_s + ": " + v.to_s
end
p y

File.open("magicout.txt", 'w') { |file| file.write(y.join("\n")) }
