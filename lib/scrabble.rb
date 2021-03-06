class Scrabble

  def score(word)
    return 0 if word == nil
    point = 0
    word.upcase.each_char do |letter|
      point += point_values[letter]
    end
    point
  end

  def score_with_multipliers(word, multipliers, extra=1)
    scored = word.upcase.chars.map.with_index do |letter, index|
      multipliers.map.with_index do |number, num_index|
        if num_index == index
          point_values[letter] * number
        end
      end.compact
    end.flatten.reduce(:+)
    (scored += 10) if word.length > 6
    scored * extra
  end

  def point_values
    {
      "A"=>1, "B"=>3, "C"=>3, "D"=>2,
      "E"=>1, "F"=>4, "G"=>2, "H"=>4,
      "I"=>1, "J"=>8, "K"=>5, "L"=>1,
      "M"=>3, "N"=>1, "O"=>1, "P"=>3,
      "Q"=>10, "R"=>1, "S"=>1, "T"=>1,
      "U"=>1, "V"=>4, "W"=>4, "X"=>8,
      "Y"=>4, "Z"=>10
    }
  end
end
