class House
    attr_reader :rhyme

    def initialize(file)
        @rhyme = File.read(file) 
    end

end
