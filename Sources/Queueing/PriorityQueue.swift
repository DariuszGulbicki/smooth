public class PriorityQueue<Element: Equatable> {

    public typealias Sorter = (_ firstElement: Element, _ secondElement: Element) -> Bool

    private var elements: [Element]

    private let priority: Sorter

    public init(sort: @escaping Sorter) {
        self.elements = []
        self.priority = sort
    }

    public func enqueue(_ element: Element) {
        elements.append(element)
        elements.sort(by: priority)
    }

    public func dequeue() -> Element? {
        return elements.isEmpty ? nil : elements.removeFirst()
    }

    public func peek() -> Element? {
        return elements.first
    }

    public func isEmpty() -> Bool {
        return elements.isEmpty
    }

    public func count() -> Int {
        return elements.count
    }

    public func clear() {
        elements.removeAll()
    }

    public func contains(_ element: Element) -> Bool {
        return elements.contains(where: { $0 == element })
    }

    public func allElements() -> [Element] {
        return elements
    }

    public func allElementsSorted() -> [Element] {
        return elements.sorted(by: priority)
    }

    public func allElementsSorted(by priority: @escaping Sorter) -> [Element] {
        return elements.sorted(by: priority)
    }

    public func allElementsSorted(by priority: @escaping Sorter, reversed: Bool) -> [Element] {
        return elements.sorted(by: priority).reversed()
    }

}