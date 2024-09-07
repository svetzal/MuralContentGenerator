import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Button(action: generateButtonWasClicked) {
                Text("Generate")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
        }
        .padding()
    }

    func generateMuralContent() -> Dictionary<String,Any> {
        // Create some stickies
        let sticky1 = Sticky(
            htmlText: "<div><span>Please visit </span><i><span>Stacey's Blog</span></i><span> for </span><b><span>fun</span></b><span> content!</span></div>",
            link: Link(url: "https://stacey.vetzal.com/")
        )

        let sticky2 = Sticky(
            htmlText: "<div>Welcome to the Sticky!</div>"
        )

        // Create a GridLayout and add widgets to it
        let gridLayout = GridLayout()
        gridLayout.addWidget(sticky1)
        gridLayout.addWidget(sticky2)

        // Prepare the widgets dictionary for serialization
        let dictionary = gridLayout.toDictionary()
        return dictionary
    }

    func generateButtonWasClicked() {
        let dictionary = generateMuralContent()
        ClipboardGateway().saveToClipboard(dictionary)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
