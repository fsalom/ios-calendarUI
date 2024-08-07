import Foundation

@Observable
open class CalendarModel {
    public let delegate: CalendarUIDelegate?
    public enum FirstWeekDay: Int {
        case monday = 2
        case sunday = 1
    }
    public enum CalendarType {
        case calendar
        case full
    }
    public let year: Int
    public var days: [Day] = []


    private let weekDays = ["Lun", "Mar", "Mie", "Jue", "Vie", "Sab", "Dom"]
    private let weekDaysSingle = ["L", "M", "X", "J", "V", "S", "D"]
    private let firstWeekDay: FirstWeekDay
    public let type: CalendarType
    public var months: [Month] = []

    public init(type: CalendarType = .calendar,
                firstWeekDay: FirstWeekDay = .monday,
                year: Int? = nil,
                delegate: CalendarUIDelegate? = nil) {
        self.type = type
        self.firstWeekDay = firstWeekDay
        if let year {
            self.year = year
        } else {
            self.year = Calendar.current.component(.year, from: Date())
        }
        self.delegate = delegate
        self.months = self.getMonths()
        self.days = self.getDays()
    }

    private func generateDays(for month: Date, with firstWeekday: FirstWeekDay) -> [Day] {
        var calendar = Calendar.current
        calendar.firstWeekday = firstWeekday.rawValue
        let range = calendar.range(of: .day, in: .month, for: month)!
        let firstOfMonth = calendar.date(from: calendar.dateComponents([.year, .month], from: month))!
        let firstDayOfWeek = calendar.component(.weekday, from: firstOfMonth)

        var days: [Day] = []
        switch firstWeekday {
        case .monday:
            let offset = (firstDayOfWeek + 5) % 7
            days = (0..<offset).map { _ in Day(number: 0, isWithinDisplayedMonth: false) }
        case .sunday:
            days = (1..<firstDayOfWeek).map { _ in Day(number: 0, isWithinDisplayedMonth: false) }
        }
        days += range.map { Day(number: $0, month: month, isWithinDisplayedMonth: true) }
        while days.count % 7 != 0 {
            days.append(Day(number: 0, isWithinDisplayedMonth: false))
        }

        return days
    }

    private func getMonths() -> [Month] {
        let calendar = Calendar.current
        let year = calendar.component(.year, from: Date())
        var months = [Month]()
        for month in 1...12 {
            let components = DateComponents(year: year, month: month)
            if let date = calendar.date(from: components) {
                months.append(Month(date: date, days: generateDays(for: date, with: self.firstWeekDay)))
            }
        }
        return months
    }

    private func getDays() -> [Day] {
        var days: [Day] = []
        for month in months {
            var daysOfMonth = month.days
            daysOfMonth.removeAll(where: {$0.number == 0})
            days.append(contentsOf: daysOfMonth)
        }
        return days
    }

    private func display() {
        delegate?.clickOn { day in

        }
    }
}
