import Foundation

public struct Week: Identifiable {
    public let id = UUID().uuidString
    let days: [Day]
    var isPast: Bool {
        guard let date = days[0].date else { return false }
        return date < Date() ? true : false
    }

}
