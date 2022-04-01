class Journey
  attr_reader :entry_station, :exit_station

  PENALTY_FARE = 6.0

  def initialize(entry_station = nil)
    @entry_station = entry_station
  end

  def end_journey(exit_station)
    @exit_station = exit_station
  end

  def fare
    complete? ? Oystercard::MINIMUM_FARE : PENALTY_FARE
  end

  private

  def complete?
    @entry_station != nil && @exit_station != nil
  end

end
