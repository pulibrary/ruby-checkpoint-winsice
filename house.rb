class House
    attr_reader :rhyme

    def initialize(file)
        @file = file
        @rhyme = File.read(file) 
    end

    # Returns an array of rhyme lines where order is determined by elements
    def create_rhyme(elements)
        rhyme_lines = []
        elements.each do |component|
            component.chomp
            if elements.index(component) == 0
                rhyme_lines.push("This is #{component.chomp}.\n")
            else
                index = elements.index(component) - 1
                prev_rhyme = rhyme_lines[index].delete_prefix("This is ")
                rhyme_lines.push("This is #{component.chomp} #{prev_rhyme.chomp}\n")
            end 
        end
        rhyme_lines
    end

    def write_rhyme(lines, file)
        rhyme = ''
        lines.each { |line| rhyme += line } 
        File.open(file, 'w') { |file| file.write(rhyme) }
    end 

    def randomize(file)
        @components = file
        elements = []
        random_rhyme = []

        File.open(@components).each { |line| elements.push(line) }

        # randomizes rhyme elements
        elements = elements.shuffle 
        
        # writes random rhyme to random-rhyme.txt
        random_rhyme = create_rhyme(elements)
        write_rhyme(random_rhyme,'random-rhyme.txt')

        random_rhyme

    end
    
    def semi_randomize(file)
        @components = file
        elements = []
        semi_random_rhyme = []

        File.open(@components).each { |line| elements.push(line) }

        # randomizes rhyme elements, ensuring rhyme ends with "the house that Jack built"
        elements = elements.shuffle 
        elements.delete("the house that Jack built\n")
        elements.unshift("the house that Jack built\n")

        # writes semi-random rhyme to semi-random-rhyme.txt
        semi_random_rhyme = create_rhyme(elements)
        write_rhyme(semi_random_rhyme,'semi-random-rhyme.txt')

        semi_random_rhyme
    end
end
