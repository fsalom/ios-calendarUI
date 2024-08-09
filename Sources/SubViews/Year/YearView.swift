import SwiftUI

public struct YearView: View {
    private let model: CalendarModel
    private let columns = Array(repeating: GridItem(.flexible(), alignment: .top), count: 3)

    public init(model: CalendarModel) {
        self.model = model
    }

    public var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 0) {
                ForEach(model.months) { month in
                    MonthView(month: month)
                }
            }
        }.padding(4)
    }
}

struct YearView_Previews: PreviewProvider {
    static var previews: some View {
        let model = CalendarModel(firstWeekDay: .monday, year: 2024)
        YearView(model: model)
    }
}
