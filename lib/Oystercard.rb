require_relative './journey'
require_relative './station'

class Oystercard
  attr_reader :balance, :limit, :journeys, :current_journey

  LIMIT = 90.0
  MINIMUM_FARE = 1.0
  
  def initialize
    @balance = 0.0
    @limit = LIMIT
    @journeys = []
    @current_journey = nil
  end

  def top_up(amount)
    raise "Top-up will exceed limit of £#{@limit}" if exceed_limit?(amount)
    @balance += amount.to_f
    "Your balance is £#{@balance}"
  end

  def touch_in(station)
    restart_journey_again if @current_journey != nil
    fail "Insufficient balance" if insufficient_balance?
    @current_journey = Journey.new(station)
  end

  def touch_out(station)
    @current_journey = Journey.new(:unknown) if @current_journey == nil
    @current_journey.end_journey(station)
    deduct(@current_journey.fare)
    journeys.push(@current_journey)
    @current_journey = nil
  end

private

  def deduct(amount)
    @balance -= amount
    "Your balance is now £#{@balance}"
  end

  def exceed_limit?(amount)
    @balance + amount > @limit
  end

  def insufficient_balance?
    @balance < MINIMUM_FARE
  end

  def restart_journey_again # If touched in twice
    @current_journey.end_journey
    deduct(@current_journey.fare)
    journeys.push(@current_journey)
  end
end