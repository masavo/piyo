# frozen_string_literal: true
require 'natto'

class Piyo
  class Text
    def initialize(text)
      @text = text
    end

    def analized
      MorphemedText.new(text)
    end

    def parsed
      parser = Natto::MeCab.new
      words = []
      parser.parse(@text) { |t| words << t.surface }

      MorphemedText.new(words.reject(&:empty?))
    end
  end
end
