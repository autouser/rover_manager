require 'spec_helper'

describe RoverManager do
  context "#command" do
    context "driving 'happy path'" do
      it "is successfull" do
        expect(RoverManager.command(<<-CMD)
          5 5
          1 2 N
          LMLMLMLMM
          3 3 E
          MMRMMRMRRM
        CMD
        ).to eq("1 3 N\n5 1 E\n")
      end
    end
    context "when plateau is wrong" do
      it "raises WrongPlateau error" do
        expect{RoverManager.command(<<-CMD)
          5 X
          1 2 N
          LMLMLMLMM
        CMD
        }.to raise_error(RoverManager::WrongPlateau)
      end
    end
    context "when rover position is wrong" do
      it "raises WrongRoverPosition error" do
        expect{RoverManager.command(<<-CMD)
          5 5
          7 7 N
          LMLMLMLMM
        CMD
        }.to raise_error(RoverManager::WrongRoverPosition)
      end
    end
    context "when rover path reach plateau cliff" do
      it "raises RoverCantMove error" do
        expect{RoverManager.command(<<-CMD)
          5 5
          5 5 N
          MM
        CMD
        }.to raise_error(RoverManager::RoverCantMove)
      end
    end
  end
end
