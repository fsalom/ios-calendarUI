import SwiftUI

public struct FullYearView: View {
    let rectangleWidth: CGFloat = 16
    let rectangleHeight: CGFloat = 16
    let spacing: CGFloat = 5

    private let model: CalendarModel

    public init(model: CalendarModel) {
        self.model = model
    }


    public var body: some View {
        let columns = [GridItem(.adaptive(minimum: rectangleWidth), spacing: spacing)]

        ScrollView {
            LazyVGrid(columns: columns, spacing: spacing) {
                ForEach(model.weeks, id: \.id) { week in
                    Rectangle()
                        .frame(width: rectangleWidth,
                               height: rectangleHeight)
                        .foregroundColor(week.isPast ? .red : .blue)
                }
            }
            .padding(spacing)
        }
    }
}

#Preview {
    FullYearView(model: CalendarModel())
}
