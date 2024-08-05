import SwiftUI

public struct CalendarUIView: View {
    var model: CalendarModel

    public init(model: CalendarModel) {
        self.model = model
    }

    public var body: some View {
        YearView(model: model)
    }
}

#Preview {
    CalendarUIView(model: CalendarModel(firstWeekDay: .monday))
}
