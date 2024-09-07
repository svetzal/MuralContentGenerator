import Foundation

class ContentBuilder {
    private var gridLayout: GridLayout

    init() {
        self.gridLayout = GridLayout()
    }

    func addWidget(widget:Widget) {
        gridLayout.addWidget(widget)
    }

    func build() -> Dictionary<String, Any> {
        return gridLayout.toDictionary()
    }
}
