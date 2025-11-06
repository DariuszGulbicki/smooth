/// # ListLike
/// 
/// A protocol that defines the basic operations of a list.
/// Used for all list implementations.
/// 
/// Each list can be expressed as an array literal.
/// 
/// ## Implementations
/// 
/// - `LinkedList`: A simple linked list implementation.
/// 
/// ## Example
/// 
/// ```swift
/// var list: ListLike<Int> = LinkedList(fromArray: [1, 2, 3])
/// 
/// list.add(4)
/// list.add(5)
/// 
/// print(list.get(at: 0)) // 1
/// print(list.get(at: 4)) // 5
/// print(list.get(at: 5)) // nil
/// ```
public protocol ListLike<Element>: ExpressibleByArrayLiteral, Sequence {

    associatedtype Element

    init()
    
    init(fromArray array: [Element])

    mutating func add(_ element: Element)
    mutating func append(_ list: Self)
    mutating func append(_ elements: [Element])
    mutating func remove(at index: Int) -> Element?
    mutating func insert(_ element: Element, at index: Int)
    func get(at index: Int) -> Element?
    mutating func clear()
    var isEmpty: Bool { get }
    var size: Int { get }

}

extension ListLike {

    /// Creates a list from an array of elements.
    /// 
    /// - Parameter array: The array of elements to add to the list.
    public init(fromArray array: [Element]) {
        self.init()
        for element in array {
            self.add(element)
        }
    }

    /// Creates a list from an array of elements.
    /// 
    /// - Parameter elements: The elements to add to the list.
    public init(_ elements: Element...) {
        self.init(fromArray: elements)
    }

    /// Creates a list from an array literal.
    ///
    /// - Parameter elements: The elements to add to the list.
    public init(arrayLiteral elements: Element...) {
        self.init(fromArray: elements)
    }

    /// Append an element to the list.
    ///
    /// - Parameter element: The element to append.
    public mutating func append(_ element: Element) {
        self.add(element)
    }

    /// Adds multiple elements to the list.
    ///
    /// - Parameter list: The list of elements to add.
    public mutating func append(_ list: Self) {
        for element in list {
            self.add(element)
        }
    }

    /// Adds multiple elements to the list.
    public mutating func append(_ elements: [Element]) {
        for element in elements {
            self.add(element)
        }
    }

    /// Removes the first element from the list.
    /// 
    /// - Returns: The removed element or `nil` if the list is empty.
    @discardableResult
    public mutating func removeFirst() -> Element? {
        return remove(at: 0)
    }

    /// Removes the last element from the list.
    /// 
    /// - Returns: The removed element or `nil` if the list is empty.
    @discardableResult
    public mutating func removeLast() -> Element? {
        return remove(at: size - 1)
    }

    /// Retrieves an element at the beginning of the list.
    /// 
    /// - Returns: The first element in the list or `nil` if the list is empty.
    public var first: Element? {
        return get(at: 0)
    }

    /// Retrieves an element at the end of the list.
    /// 
    /// - Returns: The last element in the list or `nil` if the list is empty.
    public var last: Element? {
        return get(at: size - 1)
    }

}