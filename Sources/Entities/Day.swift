import Foundation

public struct Day: Identifiable {
    public let id = UUID()
    var month: Date? = nil
    let number: Int
    let isWithinDisplayedMonth: Bool
    var date: Date {
        guard let month else { return Date() }
        let calendar = Calendar.current
        var dateComponents = calendar.dateComponents([.year, .month, .day], from: month)
        dateComponents.day = self.number
        return calendar.date(from: dateComponents) ?? Date()
    }

    init(number: Int, month: Date? = nil, isWithinDisplayedMonth: Bool) {
        self.month = month
        self.number = number
        self.isWithinDisplayedMonth = isWithinDisplayedMonth
    }
}
