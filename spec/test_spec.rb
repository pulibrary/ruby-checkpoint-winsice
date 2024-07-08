require_relative '../house.rb'

describe House do 
    context "When testing House class" do

        it "returns 'The House that Jack Built' rhyme" do
            house = House.new('rhyme.txt')

            rhyme = house.rhyme
            test_rhyme = File.read('test-rhyme.txt')

            puts rhyme 
            puts test_rhyme

            expect(rhyme).to eq test_rhyme
        end 
    end 
end


