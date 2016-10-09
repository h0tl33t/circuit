module Circuit
  class ServiceDay < SimpleDelegator
    def ordinality
      @ordinality ||= sundays_in_month.index(day) + 1
    end

    def group
      @group ||= begin
        number  = ordinality.modulo(groups.count)
        number += groups.count if number.zero?
        index   = number - 1

        groups[index]
      end
    end

    private

    def sundays_in_month
      @sundays_in_month ||= (beginning_of_month.to_date..end_of_month.to_date).select(&:sunday?).map(&:day)
    end

    def groups
      @groups ||= Group.by_position
    end
  end
end
