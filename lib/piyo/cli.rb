# frozen_string_literal: true

class Piyo
  class CLI
    class << self
      def execute(config)
        generator = TextGenerator.new
        generator.run
      end
    end
  end
end
