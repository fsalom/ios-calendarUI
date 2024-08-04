import SwiftUI

public struct YearView: View {
    private let calendar: CalendarUI
    private let columns = Array(repeating: GridItem(.flexible(), alignment: .top), count: 3)

    public init(calendar: CalendarUI) {
        self.calendar = calendar
    }

    public var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 0) {
                ForEach(calendar.months, id: \.self) { month in
                    MonthView(month: month,
                              days: calendar.generateDays(
                                for: month,
                                with: .monday),
                              monthName: calendar.monthName(from: month))
                }
            }
        }.padding(4)
    }
}

struct YearView_Previews: PreviewProvider {
    static var previews: some View {
        let calendar = CalendarUI(firstWeekDay: .monday, year: 2024)
        YearView(calendar: calendar)
    }
}
