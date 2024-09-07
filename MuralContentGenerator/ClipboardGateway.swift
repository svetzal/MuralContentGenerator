import Foundation
import AppKit

class ClipboardGateway {
    func saveToClipboard(_ dictionary: [String : Any]) {
        do {
            // Serialize to JSON
            let jsonData = try JSONSerialization.data(withJSONObject: dictionary, options: [])
            if let jsonString = String(data: jsonData, encoding: .utf8) {
                if let b64string = jsonString.data(using: .utf8)?.base64EncodedString() {
                    // Create the HTML string with Base64-encoded JSON
                    let htmlString = """
                    <meta charset='utf-8'><murally hiddenContent="mly://\(b64string)"></murally><table style="width: 99%;"><tr><td style="padding: 0;"><a href="https://stacey.vetzal.com/"><div><span>Please visit </span><i><span>Stacey's Blog</span></i><span> for </span><b><span>fun</span></b><span> content!</span></div></a></td></tr></table>
                    """
                    // Write the HTML string to the pasteboard
                    let pasteboard = NSPasteboard.general
                    pasteboard.clearContents()
                    if let htmlData = htmlString.data(using: .utf8) {
                        pasteboard.setData(htmlData, forType: .html)
                        print("HTML string successfully added to the pasteboard.")
                    }
                }
            }
        } catch {
            print("Error during JSON serialization or Base64 encoding: \(error)")
        }
    }
}
