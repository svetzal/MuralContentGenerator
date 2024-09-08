import Foundation
import SwiftUI
import WebKit

struct StickyRow: View {
    var sticky: Sticky
    
    var body: some View {
        HTMLStringView(htmlContent: sticky.htmlText)
            .frame(height:40)
            .padding()
    }
}

#Preview {
    StickyRow(sticky: Sticky(htmlText: "Hello"))
}

struct HTMLStringView: NSViewRepresentable {
    @Environment(\.colorScheme) var colorScheme
    let htmlContent: String

    func makeNSView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.setValue(false, forKey: "drawsBackground")
        return webView
    }

    func updateNSView(_ nsView: WKWebView, context: Context) {
        let html = colorScheme == .dark ? "<div style=\"color: #ffffff\">\(htmlContent)</div>" : htmlContent
        nsView.loadHTMLString(html, baseURL: nil)
    }
}
