# Remember: every line of code one liability!
# Usage example: `puts ASCIIArabic.translit('السلام عليكم')`

class ASCIIArabic
  def initialize(str_ara)
    @arabic = str_ara || String.new
    @replacements = [
      # The Abjad
      ['ا', 'a' ], ['ب', 'b' ], ['ت', 't' ], ['ث', 'th'], ['ج', 'j' ],
      ['ح', 'H' ], ['خ', 'kh'], ['د', 'd' ], ['ذ', 'dh'], ['ر', 'r' ], 
      ['ز', 'z' ], ['س', 's' ], ['ش', 'sh'], ['ص', 'S' ], ['ض', 'D' ],
      ['ط', 'T' ], ['ظ', 'Z' ], ['ع', '3' ], ['غ', 'gh'], ['ف', 'f' ],
      ['ق', 'q' ], ['ك', 'k' ], ['ل', 'l' ], ['م', 'm' ], ['ن', 'n' ],
      ['ه', 'h' ], ['و', 'w' ], ['ي', 'y' ],
      # Various forms of Hamza
      ['ء', '2' ], ['أ', '2' ], ['آ', '2a'], ['ؤ', '2' ], ['ئ', '2' ],
      ['ى', 'a' ], ['ة', 'a' ],
      # Space
      [' ', '_' ],
      # Most important diacritica
      ['َ', 'a'  ], ['ِ', 'i'  ], ['ُ', 'u'  ], ['ً', 'an' ], ['ٍ', 'in' ],
      ['ٌ', 'un' ]
    ]
  end

  def self.translit(str_ara)
    instance = self.new(str_ara)
    return instance.translit
  end

  def translit
    @replacements.each do |needle, replacement|
      @arabic.gsub!(needle, replacement)
    end
    @arabic.gsub!(/[^_[[:alnum:]]]/, '') # Only Latin script
  end
end
