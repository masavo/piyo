# frozen_string_literal: true

class Piyo
  class MorphemedText
    def initialize(text)
      @text = text
    end

    # @return [Array<Array>] [[nil, 私,は,],,[です,。,nil],]
    def chained
      @text.unshift(nil)
      @text.push(nil)

      last_index = @text.length-3

      [*0..last_index].map { |i| [@text[i], @text[i+1], @text[i+2]] }
    end

    private

    def parsed_text
      @text.parsed
    end
  end
end
