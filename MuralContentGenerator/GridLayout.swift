class GridLayout {
    var margin: Int = 23
    var widgets: [Widget] = []

    // Function to add a widget and arrange its position in the grid
    func addWidget(_ widget: Widget) {
        let row = widgets.count / 3  // Assuming a 3-column grid
        let col = widgets.count % 3

        // Calculate x and y based on grid position, taking margin into account
        widget.x = col * (widget.width + margin)
        widget.y = row * (widget.height + margin)

        // Add widget to the list
        widgets.append(widget)
    }

    // Function to get all widgets serialized as a dictionary
    func toDictionary() -> [String: Any] {
        return [
            "widgets": widgets.map { $0.toDictionary() }
        ]
    }
}
