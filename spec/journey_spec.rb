require_relative '../lib/journey'

describe Journey do
  let(:journey) { Journey.new(:station0) }
  let(:station1) { double (:Station) }
  let(:station2) { double (:Station) }
  
  it "has an entry station when created" do
    expect(journey.entry_station).to eq :station0
  end

  it "sets exit station as nil when created" do
    expect(journey.exit_station).to eq nil
  end

  # Test for #complete? private method.
  # it "sets 'complete' to false when created" do
  #   expect(journey.complete?).to be false
  # end

  context "#end_journey" do
    it "updates the exit station to the argument that is passed" do
      expect { journey.end_journey(station1) }.to change{ journey.exit_station }.to(station1)
    end
  end

  context '#fare' do

    it "returns £1 if it's a normal completed journey" do
      journey.end_journey('Euston')
      expect(journey.fare).to eq Oystercard::MINIMUM_FARE
    end

    it "returns £6 if there is no touch_out" do
      journey.end_journey(nil)
      expect(journey.fare).to eq Journey::PENALTY_FARE
    end

    it "returns £6 if there is no touch_in" do
      journey2 = Journey.new(nil)
      journey2.end_journey(station1)
      expect(journey2.fare).to eq Journey::PENALTY_FARE
    end  
  end
end

