import SwiftUI

struct CalendarUIView: View {
    var model: CalendarModel

    public init(model: CalendarModel) {
        self.model = model
    }

    var body: some View {
        YearView(calendar: model)
    }
}

#Preview {
    CalendarUIView()
}
