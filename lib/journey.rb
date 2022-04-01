class Journey
  attr_reader :entry_station, :exit_station

  PENALTY_FARE = 6.0

  def initialize(entry_station)
    @entry_station = entry_station
    @exit_station = nil
  end

  def complete?
    @exit_station != nil
  end

  def end_journey(exit_station = :unknown)
    @exit_station = exit_station
  end

  def fare
    is_penalty_journey ? PENALTY_FARE : Oystercard::MINIMUM_FARE
  end

  private

  def is_penalty_journey
    @entry_station == :unknown || @exit_station == :unknown
  end

end
