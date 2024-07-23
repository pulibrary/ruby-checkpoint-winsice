require 'spec_helper'
require_relative '../house.rb'

describe House do 

    context "when creating House" do
        house = House.new('rhyme.txt')

        it "returns 'The House that Jack Built' rhyme" do
            rhyme = house.rhyme
            test_rhyme = File.read('test-rhyme.txt')

            # compares rhyme to copy of the 'The House that Jack Built' rhyme
            expect(rhyme).to eq test_rhyme
        end

        it "returns randomized 'The House that Jack Built' rhyme" do
            random_rhyme = house.randomize('rhyme-elements.txt')
            test_rhyme_pattern(random_rhyme, 'rhyme-elements.txt')
        end

        it "returns semi-randomized 'The House that Jack Built' rhyme" do
            semi_random_rhyme = house.semi_randomize('rhyme-elements.txt')
            test_rhyme_pattern(semi_random_rhyme, 'rhyme-elements.txt')
            semi_random_rhyme.each { |line| expect(line.chomp).to end_with("the house that Jack built.")}
        end 

    end 

end

def test_rhyme_pattern(lines, file)
    # checks rhyme consists of 12 lines
    expect(lines.length).to eq 12

    # checks that traditional rhyme pattern holds
    lines.each do |line|
        index = lines.index(line)

        if index == 11
            File.readlines(file).each do |line|
                expect(lines[11]).to include(line.chomp)
            end
        else
            prev_line = line.delete_prefix("This is ")
            expect(lines[index + 1]).to include(prev_line)
        end
    end
end 
