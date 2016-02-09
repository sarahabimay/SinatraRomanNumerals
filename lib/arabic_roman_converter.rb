class ArabicRomanConverter
  def self.convert(from_arabic)
    romans = ""
    {
      1000 => "M",
      900  => "CM",
      500  => "D",
      400  => "CD",
      100  => "C",
      90   => "XC",
      50   => "L",
      10   => "X",
      9    => "IX",
      5    => "V",
      4    => "IV",
      1    => "I"
    }.each do |arabic, roman|
      while(from_arabic >= arabic)
        romans += roman
        from_arabic -= arabic
      end
    end
    romans
  end
end
