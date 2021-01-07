class Clock
  attr_accessor :hour, :minute

  def initialize(hour, minute)
    @hour = hour
    @minute = minute
  end

  def self.at(hour, minute = 0)
    wrap_around_hours = 0
    if minute > 59
      wrap_around_hours += minute / 60
      minute %= 60
    end
    Clock.new(hour + wrap_around_hours, minute)
  end

  def to_s
    display_hour = self.hour.digits.size == 2 ? self.hour.to_s : "0#{self.hour}"
    display_minute = self.minute.digits.size == 2 ? self.minute.to_s : "0#{self.minute}"
    "#{display_hour}:#{display_minute}"
  end

  def +(amt)
    self.minute += amt
    if self.minute > 60
      self.hour += self.minute / 60
      self.minute %= 60
    end

    if self.hour > 23
      self.hour %= 24
    end
    self
  end

  def -(amt)
    self.minute -= amt
    if self.minute < 0
      self.hour -= 1 + self.minute.abs / 60
      self.minute %= 60
    end

    if self.hour < 0
      self.hour += 24
    end
    self
  end

  def ==(other_clock)
    self.hour == other_clock.hour &&\
    self.minute == other_clock.minute
  end
end