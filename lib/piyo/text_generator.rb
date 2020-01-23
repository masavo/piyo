# frozen_string_literal: true

class Piyo
  class TextGenerator
    def run
      chains = MarcovChain.new(get_chained_texts)
      # chains.marcov
      chains.start_loop
      text = chains.generate_text
      puts text.size
      puts text
      # randm select
    end

    def get_chained_texts
      get_texts.map { |text| text.parsed.chained }
    end

    def get_texts
      get_tweets.map { |t| Text.new(t) }
    end

    def get_tweets
      ["私はココアです",
       "形態素解析とは、自然言語で書かれた文を言語上の最小単位である形態素に分割し、それぞれの品詞や変化などを割り出すこと。 ITの分野ではコンピュータによる自然言語処理の一つとして、かな漢字変換や全文検索、機械翻訳などで用いられる。",
       "撃っていいのは撃たれる覚悟のある奴だけだ",
       "私の尊厳を喰らいなさい",
       "夢を見たんですよ。それはきれいな柊でした。"
      ]
    end


    def malcov
    end
  end
end
