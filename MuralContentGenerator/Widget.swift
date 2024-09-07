import Foundation

class Widget {
    var height: Int
    var width: Int
    var x: Int = 0  // Default x position
    var y: Int = 0  // Default y position
    var type: String

    init(height: Int, width: Int, type: String) {
        self.height = height
        self.width = width
        self.type = type
    }

    func toDictionary() -> [String: Any] {
        return [
            "height": height,
            "width": width,
            "x": x,
            "y": y,
            "type": type
        ]
    }
}
