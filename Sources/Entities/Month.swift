import Foundation

public struct Month: Identifiable {
    public let id = UUID()
    var date: Date
    let days: [Day]
    var name: String { getMonthName() }

    func getMonthName() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM"
        return dateFormatter.string(from: date)
    }
}
