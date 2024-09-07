import SwiftUI
import WebKit

struct ContentView: View {
    var stickies: [Sticky]

    init() {
        // Initialize the stickies array
        self.stickies = [
            Sticky(
                htmlText: "<div><span>Please visit </span><i><span>Stacey's Blog</span></i><span> for </span><b><span>fun</span></b><span> content!</span></div>",
                link: Link(url: "https://stacey.vetzal.com/")
            ),
            Sticky(
                htmlText: "<div>Welcome to the Sticky!</div>"
            )
        ]
    }

    var body: some View {
        VStack {
            List(stickies, id: \.htmlText) { sticky in
                StickyRow(sticky: sticky)
            }

            Button(action: generateButtonWasClicked) {
                Text("Generate")
            }
            
        }
        .padding()
    }

    func generateButtonWasClicked() {
        let builder = ContentBuilder()

        for sticky in stickies {
            builder.addWidget(widget: sticky)
        }

        ClipboardGateway().saveToClipboard(builder.build())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
