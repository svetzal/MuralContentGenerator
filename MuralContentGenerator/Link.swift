import Foundation

class Link {
    var url: String
    var source: String = "url"  // Default value set here

    init(url: String) {
        self.url = url
    }

    func toDictionary() -> [String: String] {
        return [
            "url": url,
            "source": source
        ]
    }
}
