# frozen_string_literal: true

module Roti
  class << self
    CHARACTOR_LIST = ('!'..'~').to_a
    CHARACTOR_LIST_SIZE = CHARACTOR_LIST.size

    def encode(string)
      string.chars.map.with_index(1) { |charactor, index| encode_charactor(charactor, index) }.join
    end

    def decode(string)
      string.chars.map.with_index(1) { |charactor, index| decode_charactor(charactor, index) }.join
    end

    private

    def encode_charactor(charactor, index)
      return charactor unless CHARACTOR_LIST.include?(charactor)

      CHARACTOR_LIST[(CHARACTOR_LIST.index(charactor) + index) % CHARACTOR_LIST_SIZE]
    end

    def decode_charactor(charactor, index)
      return charactor unless CHARACTOR_LIST.include?(charactor)

      CHARACTOR_LIST[(CHARACTOR_LIST.index(charactor) - index) % CHARACTOR_LIST_SIZE]
    end
  end
end
