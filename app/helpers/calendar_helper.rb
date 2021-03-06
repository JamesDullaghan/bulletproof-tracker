module CalendarHelper
  def calendar(date = Date.today, &block)
    Calendar.new(self, date, block).table
  end

  class Calendar < Struct.new(:view, :date, :callback)
    HEADER = %w[SUN MON TUE WED THU FRI SAT]
    START_DAY = :sunday

    delegate :content_tag, to: :view

    def table
      content_tag :section, role: "main", class: 'calendar' do
        header + week_rows
      end
    end

    def header
      content_tag :ul, class: "day-row" do
        HEADER.map { |day| content_tag :li, day, class: "day" }.join.html_safe
      end
    end

    def week_rows
      weeks.map do |week|
        content_tag :ul, class: "week-row" do
          week.map { |day| day_cell(day) }.join.html_safe
        end
      end.join.html_safe
    end

    def day_cell(day)
      content_tag :li, view.capture(day, &callback), class: day_classes(day)
    end

    def day_classes(day)
      classes = []
      classes << "today" if day == Date.today
      classes << "not-month" if day.month != date.month
      classes.empty? ? nil : classes.join(" ")
    end

    def weeks
      first = date.beginning_of_month.beginning_of_week(START_DAY)
      last = date.end_of_month.end_of_week(START_DAY)
      (first..last).to_a.in_groups_of(7)
    end
  end
end