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
  end
end
