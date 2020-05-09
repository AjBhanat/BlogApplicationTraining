module WordCheck
  extend ActiveSupport::Concern
  def check_bad_word(word)
    word_check = false
    bad_w = ['bad', 'poor', 'filthy', 'dirty', 'stupid']
    bad_w.each do |w|
      if (word).eql? w
        word_check = true
      else
        word_check =false
      end
    end
    word_check
  end

  module ClassMethods
    def check_vowel(string)
      v = 0
      c = 0
      while c < string.length do
        if string[c]=="a" || string[c]=="e" || string[c]=="i" || string[c]=="o" || string[c]=="u"
          v += 1
        end
        c += 1
      end
      v
    end

    def count_words(string)
      string.split(' ').size
    end
  end


end