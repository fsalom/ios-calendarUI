import SwiftUI

struct DayView: View {
    let day: Day

    var body: some View {
        Text("\(day.number)")
            .font(.system(size: 9))
            .frame(width: 15, height: 15)
            .background(day.isWithinDisplayedMonth ? Color.blue : Color.gray)
            .cornerRadius(5)
            .foregroundColor(.white)
    }
}

#Preview {
    DayView(day: Day(number: 10, isWithinDisplayedMonth: true))
}
