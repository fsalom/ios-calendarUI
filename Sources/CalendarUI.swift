import Foundation

open class CalendarUI: ObservableObject {
    public enum FirstWeekDay: Int {
        case monday = 2
        case sunday = 1
    }

    private let firstWeekDay: FirstWeekDay
    private let year: Int
    public let delegate: CalendarUIDelegate?

    init(firstWeekDay: FirstWeekDay, year: Int? = nil, delegate: CalendarUIDelegate? = nil) {
        self.firstWeekDay = firstWeekDay
        if let year {
            self.year = year
        } else {
            self.year = Calendar.current.component(.year, from: Date())
        }
    }

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
    
    let weekDays = ["Lun", "Mar", "Mie", "Jue", "Vie", "Sab", "Dom"]
    let weekDaysSingle = ["L", "M", "X", "J", "V", "S", "D"]

    func generateDaysStartingSunday(for month: Date, with firstWeekday: FirstWeekDay) -> [Day] {
        var calendar = Calendar.current
        calendar.firstWeekday = firstWeekday.rawValue
        // Range of days of this month
        let range = calendar.range(of: .day, in: .month, for: month)!
        // First day of month
        let firstOfMonth = calendar.date(from: calendar.dateComponents([.year, .month], from: month))!
        // First day of week of first month
        let firstDayOfWeek = calendar.component(.weekday, from: firstOfMonth)
        
        var days: [Day] = []
        switch firstWeekday {
        case .monday:
            let offset = (firstDayOfWeek + 5) % 7
            days = (0..<offset).map { _ in Day(number: 0, isWithinDisplayedMonth: false) }
        case .sunday:
            days = (1..<firstDayOfWeek).map { _ in Day(number: 0, isWithinDisplayedMonth: false) }
        }
        days += range.map { Day(number: $0, isWithinDisplayedMonth: true) }
        while days.count % 7 != 0 {
            days.append(Day(number: 0, isWithinDisplayedMonth: false))
        }

        return days
    }

    func monthName(from date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM"
        return dateFormatter.string(from: date)
    }

    func display() {
        delegate.clickOn { <#Day#> in
            <#code#>
        }
    }
}
