import Foundation

public struct Day: Identifiable {
    public let id = UUID()
    var month: Date? = nil
    var number: Int = 0
    var isWithinDisplayedMonth: Bool = false
    var date: Date? = nil
    var isPast: Bool {
        guard let date = date else { return false }
        return date < Date() ? true : false
    }

    init(number: Int, month: Date? = nil, isWithinDisplayedMonth: Bool) {
        self.month = month
        self.number = number
        self.isWithinDisplayedMonth = isWithinDisplayedMonth
        self.date = calculateDate()
    }

    init(date: Date) {
        self.date = date
    }

    func calculateDate() -> Date {
        guard let month else { return Date() }
        let calendar = Calendar.current
        var dateComponents = calendar.dateComponents([.year, .month, .day], from: month)
        dateComponents.day = self.number
        return calendar.date(from: dateComponents) ?? Date()
    }
}
