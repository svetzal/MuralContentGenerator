import Foundation

class Sticky: Widget {
    var fontSize: Double = 18.875
    var backgroundColor: String = "#fcfe7d"
    var htmlText: String
    var link: Link?
    var textType: String = "realNote"
    var textAlign: String = "center"
    var fontFamily: String = "proxima-nova"

    init(htmlText: String, link: Link? = nil) {
        self.htmlText = htmlText
        self.link = link
        super.init(height: 138, width: 138, type: "murally.widget.TextWidget")
    }

    // Override the toDictionary method to include Sticky-specific properties
    override func toDictionary() -> [String: Any] {
        var properties: [String: Any] = [
            "fontSize": fontSize,
            "backgroundColor": backgroundColor,
            "htmlText": htmlText,
            "textType": textType,
            "textAlign": textAlign,
            "fontFamily": fontFamily
        ]

        if let link = link {
            properties["link"] = link.toDictionary()
        }

        return [
            "height": height,
            "width": width,
            "x": x,
            "y": y,
            "properties": properties,
            "type": type  // Corrected type value here
        ]
    }
}
