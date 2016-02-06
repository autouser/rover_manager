require 'spec_helper'

describe Rover do
  let(:plateau) {Plateau.new max_x: 9, max_y: 9}
  let(:rover)   { Rover.new x: 1, y: 2, orientation: 'N', plateau: plateau }

  context "#initialize" do
    context "when attributes are correct" do
      it "raises no error" do
        expect{ rover }.not_to raise_error
      end

      it "sets attributes" do
        expect( rover.x ).to eq(1)
        expect( rover.y ).to eq(2)
        expect( rover.orientation ).to eq('N')
      end
    end
  end

  context "#x" do

    context "when is an positive integer" do
      it "sets attribute" do
        expect { rover.x = 7 }.not_to raise_error
        expect( rover.x ).to eq(7)
      end
    end

    context "when is not a number" do
      it "raises 'NotAPositiveInteger' error" do
        expect { rover.x = 'wrong' }.to raise_error(RoverManager::NotAPositiveInteger)
      end
    end

    context "when is not an integer" do
      it "raises 'NotAPositiveInteger' error" do
        expect { rover.x = 5.5 }.to raise_error(RoverManager::NotAPositiveInteger)
      end
    end

    context "when is a negative integer" do
      it "raises 'NotAPositiveInteger' error" do
        expect { rover.x = -5 }.to raise_error(RoverManager::NotAPositiveInteger)
      end
    end

  end

  context "#y" do

    context "when is an positive integer" do
      it "sets attribute" do
        expect { rover.y = 7 }.not_to raise_error
        expect( rover.y ).to eq(7)
      end
    end

    context "when is not a number" do
      it "raises 'NotAPositiveInteger' error" do
        expect { rover.y = 'wrong' }.to raise_error(RoverManager::NotAPositiveInteger)
      end
    end

    context "when is not an integer" do
      it "raises 'NotAPositiveInteger' error" do
        expect { rover.y = 5.5 }.to raise_error(RoverManager::NotAPositiveInteger)
      end
    end

    context "when is a negative integer" do
      it "raises 'NotAPositiveInteger' error" do
        expect { rover.y = -5 }.to raise_error(RoverManager::NotAPositiveInteger)
      end
    end

  end

  context "#orientation" do
    context "when is an 'N','O','S','W'" do
      it "sets attribute" do
        %w{ N O S W }.each do |orientation|
          expect { rover.orientation = orientation }.not_to raise_error
          expect( rover.orientation ).to                    eq(orientation)
        end
      end
    end

    context "when is not valid orientation" do
      it "raises 'InvalidOrientation' error" do
        expect{ rover.orientation = 'Q' }.to raise_error(Rover::InvalidOrientation)
      end
    end
  end

  context "#plateau" do
    context "when is a kind of Plateau" do
      it "sets attribute" do
        new_plateau = Plateau.new(max_x: 9, max_y: 9)
        expect { rover.plateau = new_plateau }.not_to raise_error
        expect( rover.plateau ).to eq(new_plateau)
      end
    end    
  end


end
