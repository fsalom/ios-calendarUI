import SwiftUI

struct MonthView: View {
    let month: Month

    private let columns = Array(repeating: GridItem(.flexible()), count: 7)

    var body: some View {
        VStack(spacing: 0) {
            Text(month.name)
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
                    ForEach(month.days) { day in
                        DayView(day: day)
                    }
                }
            }
            .padding()
        }
}

#Preview {
    MonthView(month: Month(date: Date(), days: []))
}
