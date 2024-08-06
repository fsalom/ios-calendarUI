import SwiftUI

public struct CalendarUIView: View {
    @State private var model: CalendarModel

    public init(model: CalendarModel) {
        self.model = model
    }

    public var body: some View {
        switch model.type {
        case .full:
            FullYearView(model: model)
        case .calendar:
            YearView(model: model)
        }
    }
}

#Preview {
    CalendarUIView(model: CalendarModel(firstWeekDay: .monday))
}
