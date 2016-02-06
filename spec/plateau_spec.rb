require 'spec_helper'

describe Plateau do

  let(:plateau) { Plateau.new max_x: 5, max_y: 5 }

  context "#initialize" do
    context "when attributes are correct" do
      it "is raises no error" do
        expect { plateau }.not_to raise_error
      end

      it "sets attributes" do
        expect( plateau.max_x ).to eq(5)
        expect( plateau.max_y ).to eq(5)
      end
    end
  end



  context "#max_x" do

    context "when is an positive integer" do
      it "sets attribute" do
        expect { plateau.max_x = 7 }.not_to raise_error
        expect( plateau.max_x ).to eq(7)
      end
    end

    context "when is not a number" do
      it "raises 'NotAPositiveInteger' error" do
        expect { plateau.max_x = 'wrong' }.to raise_error(RoverManager::NotAPositiveInteger)
      end
    end

    context "when is not an integer" do
      it "raises 'NotAPositiveInteger' error" do
        expect { plateau.max_x = 5.5 }.to raise_error(RoverManager::NotAPositiveInteger)
      end
    end

    context "when is a negative integer" do
      it "raises 'NotAPositiveInteger' error" do
        expect { plateau.max_x = -5 }.to raise_error(RoverManager::NotAPositiveInteger)
      end
    end

  end


  context "#max_y" do

    context "when is an positive integer" do
      it "sets attribute" do
        expect { plateau.max_y = 7 }.not_to raise_error
        expect( plateau.max_y ).to eq(7)
      end
    end

    context "when is not a number" do
      it "raises 'NotAPositiveInteger' error" do
        expect { plateau.max_y = 'wrong' }.to raise_error(RoverManager::NotAPositiveInteger)
      end
    end

    context "when is not an integer" do
      it "raises 'NotAPositiveInteger' error" do
        expect { plateau.max_y = 5.5 }.to raise_error(RoverManager::NotAPositiveInteger)
      end
    end

    context "when is a negative integer" do
      it "raises 'NotAPositiveInteger' error" do
        expect { plateau.max_y = -5 }.to raise_error(RoverManager::NotAPositiveInteger)
      end
    end

  end

end