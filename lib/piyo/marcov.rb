# frozen_string_literal: true

class Piyo
  # TODO 命名 多分違う
  class MarcovChain
    # @param chains []
    def initialize(chains)
      @chains = chains
      @words = []
    end

    def generate_text
      @words.join("")
    end

    def validate_140
      if generate_text.size > 140
        @words = []
        start_loop
      end
      exit 0
    end

    def start_loop

      # nilから始まるブロックを選ぶ
      blocks = search_blocks(nil)
      next_word = connect_next_word(blocks)
      blocks = search_blocks(next_word)

      loop do
        next_word = connect_next_word(blocks)
        return validate_140 unless next_word
        blocks = search_blocks(next_word)
      end
    end

    # ある特定の形態素から始まる[Array<String>]の集合
    #
    # @param [Array<Array><String>] 最初のがそれではじまるやつ
    # @return
    def search_blocks(morpheme)
      aaa = []
      @chains.each { |blocks| aaa << blocks.select {|block| block.first == morpheme } }
      aaa.map(&:first).compact
    end

    def connect_next_word(blocks)
        block = blocks[rand(blocks.size)]
        return nil unless block
        next_word = block[1]
        @words << next_word

        next_word
    end

    # @param [Array<Array<String>>]find_blocksの結果
    # @param [Array<String>] つなげている文章のArray
    # @return [Array<String>] つなげている文章のArray
    def connect_blocks(searched_blocks)
      # 取得したblocksの中からランダムに取得する
      # つまり、一番最初の文字以外をだす
      selected_block = select_randam(searched_blocks)
      selected_block.drop(1)
    end

    # @param [Array<String>] つなげている文章のArray
    # @return [Array<String>] つなげている文章のArray
    def select_randam(searched_blocks)
      randam_index = rand(searched_blocks.size)
      searched_blocks[randam_index]
    end
# def findBlocks(array, target)
#   blocks = []
#   for block in array
#     if block[0] == target
#       blocks.push(block)
#     end
#   end
#
#   return blocks
# end
#
# def connectBlocks(array, dist)
#   i = 0
#   for word in array[rand(array.length)]
#     if i != 0
#       dist.push(word)
#     end
#     i += 1
#   end
#   return dist
# end
# def marcov()
#   array = @chains.first
#   result = []
#   block = []
#
#   # nilから始まるブロックを選ぶ
#   block = findBlocks(array, nil)
#   result = connectBlocks(block, result)
#
#   # resultの最後の単語がnilになるまで繰り返す
#   while result[result.length-1] != nil do
#     block = findBlocks(array, result[result.length-1])
#     result = connectBlocks(block, result)
#
#   end
#
#   return result
# end
  end
end
