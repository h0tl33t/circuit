module Circuit
  class Schedule
    WEEKS_OUT = 5

    def sundays
      @sundays ||= WEEKS_OUT.times.map do |week_number|
        ServiceDay.new(week_number.week.from_now.sunday)
      end
    end
  end
end
