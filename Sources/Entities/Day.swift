import Foundation

public struct Day: Identifiable {
    public let id = UUID()
    let number: Int
    let isWithinDisplayedMonth: Bool
}
