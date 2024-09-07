import Foundation
import SwiftUI
import WebKit

struct StickyRow: View {
    var sticky: Sticky
    
    var body: some View {
        HTMLStringView(htmlContent: sticky.htmlText)
//            .frame(width: 800, height: 200)
            .padding()
    }
}

#Preview {
    StickyRow(sticky: Sticky(htmlText: "Hello"))
}

struct HTMLStringView: NSViewRepresentable {
    let htmlContent: String

    func makeNSView(context: Context) -> WKWebView {
        let webView = WKWebView()
//        webView.setValue(false, forKey: "drawsBackground")
        return webView
    }

    func updateNSView(_ nsView: WKWebView, context: Context) {
        let page = "<html><body>\(htmlContent)</body></html>"
        print(page)
        nsView.loadHTMLString(page, baseURL: nil)
    }
}
