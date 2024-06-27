import SwiftUI

struct YearView: View {
    private let calendar = CalendarUI(firstWeekDay: .monday, year: 2024)

    private let columns = Array(repeating: GridItem(.flexible(), alignment: .top), count: 3)

    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 0) {
                ForEach(calendar.months, id: \.self) { month in
                    MonthView(month: month,
                              days: calendar.generateDaysStartingSunday(
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
        YearView()
    }
}
