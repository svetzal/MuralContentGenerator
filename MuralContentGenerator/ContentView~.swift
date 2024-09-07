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


    func generateButtonWasClicked() {
        let dictionary = ContentBuilder().generateMuralContent()
        ClipboardSaver.saveToClipboard(dictionary)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
