module Glitch

  class Instruction
    attr_reader :layer, :corruption_rate

    def initialize(layer, corruption_rate)
      @layer = layer
      @corruption_rate = corruption_rate
    end

    def serialize
      return {
        layer: @layer,
        corruption_rate: @corruption_rate
      }
    end

    def self.random_instruction
      layer = rand(5)
      rate = rand(5)
      return self.new(layer, rate)
    end

    def to_s
      return "Instruction: { layer: #{@layer}, c_rate: #{@corruption_rate} }"
    end
  end

end
