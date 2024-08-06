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

    private let weekDays = ["Lun", "Mar", "Mie", "Jue", "Vie", "Sab", "Dom"]
    private let weekDaysSingle = ["L", "M", "X", "J", "V", "S", "D"]
    private let firstWeekDay: FirstWeekDay
    private let year: Int
    let type: CalendarType
    let months: [Date] = {
        let calendar = Calendar.current
        let year = calendar.component(.year, from: Date())
        var dates = [Date]()
        for month in 1...12 {
            let components = DateComponents(year: year, month: month)
            if let date = calendar.date(from: components) {
                dates.append(date)
            }
        }
        return dates
    }()

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
    }

    func generateDays(for month: Date, with firstWeekday: FirstWeekDay) -> [Day] {
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

    func getDays() -> [Day] {
        var days: [Day] = []
        for month in months {
            var daysOfMonth = generateDays(for: month, with: self.firstWeekDay)
            daysOfMonth.removeAll(where: {$0.number == 0})
            days.append(contentsOf: daysOfMonth)
        }
        return days
    }

    func monthName(from date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM"
        return dateFormatter.string(from: date)
    }    

    func display() {
        delegate?.clickOn { day in

        }
    }
}
