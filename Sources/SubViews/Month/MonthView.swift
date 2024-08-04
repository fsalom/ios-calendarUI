import SwiftUI

struct MonthView: View {
    let month: Date
    let days: [Day]
    let monthName: String

    private let columns = Array(repeating: GridItem(.flexible()), count: 7)

    var body: some View {
        VStack(spacing: 0) {
                Text(monthName)
                    .font(.footnote)
            /*
                HStack(spacing: 0) {
                    ForEach(viewModel.weekDaysSingle, id: \.self) { day in
                        Text(day)
                            .font(.footnote)
                            .frame(maxWidth: .infinity)
                            .padding(0)
                    }
                }
                .background(Color.blue)
                .frame(maxWidth: .infinity, alignment: .leading)
             */
                LazyVGrid(columns: columns, spacing: 0) {
                    ForEach(days) { day in
                        DayView(day: day)
                    }
                }
            }
            .padding()
        }
}

#Preview {
    MonthView(month: Date(), days: [], monthName: "test")
}
