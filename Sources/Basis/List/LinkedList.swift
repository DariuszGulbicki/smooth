/// # LinkedList
/// 
/// Basic singly linked list implementation.
/// 
/// Used to store list elements in a specific order.
/// 
/// If you need a queue-like data structure, you can use `LinkedQueue` which is based on this list implementation.
/// 
/// ## Performance
/// 
/// - Appending and prepending: `O(1)`
/// - Getting: `O(n)` or `O(1)` at the beggining or end of the list.
/// - Removing: `O(n)` or `O(1)` at the beggining or end of the list.
/// - Inserting: `O(n)` or `O(1)` at the beggining or end of the list.
/// - Clearing: `O(1)`
/// 
/// ## Example
/// 
/// ```swift
/// var list = LinkedList<Int>()
/// list.add(1)
/// list.add(2)
/// list.add(3)
/// 
/// print(list.get(at: 0)) // 1
/// print(list.get(at: 2)) // 3
/// print(list.get(at: 3)) // nil
/// ```
public struct LinkedList<T>: ListLike, Sequence, CustomStringConvertible {

    /// Represents a single node in the linked list.
    /// 
    /// Each node contains a value and a reference to the next node in the list.
    fileprivate class Node {
        var value: T
        var next: Node?

        init(value: T) {
            self.value = value
            self.next = nil
        }
    }
    
    /// Pointer to the first node in the list.
    private var head: Node?

    /// Pointer to the last node in the list.
    /// 
    /// This pointer is used to optimize operations that require access to the last element.
    private var tail: Node?

    /// Represents the number of elements in the list.
    private var count: Int = 0

    /// A textual representation of the list.
    public var description: String {
        var result = "["
        var node = head
        while node != nil {
            result += "\(node!.value)"
            node = node!.next
            if node != nil { result += ", " }
        }
        result += "]"
        return result
    }
    
    // MARK: - ListLike Protocol Methods
    
    /// Creates an empty linked list.
    public init() { }

    /// Appends an element to the end of the list.
    /// 
    /// - Parameter element: The element to append.
    public mutating func add(_ element: T) {
        let newNode = Node(value: element)
        if let tailNode = tail {
            tailNode.next = newNode
        } else {
            head = newNode
        }
        tail = newNode
        count += 1
    }

    /// Removes an element at the specified index.
    /// 
    /// Linked lists are optimized for removing elements at the beginning or end of the list.
    /// This generally results in `O(1)` time complexity for these operations instead of `O(n)`.
    /// 
    /// - Parameter index: The index of the element to remove.
    /// - Returns: The removed element or `nil` if the index is out of bounds.
    @discardableResult
    public mutating func remove(at index: Int) -> T? {
        guard index >= 0 && index < count else { return nil }
        var removedValue: T?
        if index == 0 {
            removedValue = head?.value
            head = head?.next
            if head == nil { tail = nil }
        } else {
            var prevNode = head
            for _ in 0..<index - 1 {
                prevNode = prevNode?.next
            }
            removedValue = prevNode?.next?.value
            prevNode?.next = prevNode?.next?.next
            if prevNode?.next == nil { tail = prevNode }
        }
        
        count -= 1
        return removedValue
    }
    
    /// Retrieves an element at the specified index.
    /// 
    /// Linked lists are optimized for getting elements at the beginning or end of the list.
    /// This generally results in `O(1)` time complexity for these operations instead of `O(n)`.
    ///
    /// - Parameter index: The index of the element to retrieve.
    /// - Returns: The element at the specified index or `nil` if the index is out of bounds.
    public func get(at index: Int) -> T? {
        guard index >= 0 && index < count else { return nil }
        
        var currentNode = head
        for _ in 0..<index {
            currentNode = currentNode?.next
        }
        
        return currentNode?.value
    }


    /// Inserts an element at the specified index.
    /// 
    /// Linked lists are optimized for inserting elements at the beginning or end of the list.
    /// This generally results in `O(1)` time complexity for these operations instead of `O(n)`.
    /// 
    /// - Parameters:
    ///  - element: The element to insert.
    ///  - index: The index at which to insert the element.
    /// 
    /// If the index is out of bounds, the method will raise a fatal error.
    public mutating func insert(_ element: T, at index: Int) {
        guard index >= 0 && index <= count else {
            fatalError("Index out of bounds")
        }
        let newNode = Node(value: element)
        if index == 0 {
            newNode.next = head
            head = newNode
            if tail == nil { tail = newNode }
        } else {
            var prevNode = head
            for _ in 0..<index - 1 {
                prevNode = prevNode?.next
            }
            newNode.next = prevNode?.next
            prevNode?.next = newNode
            
            if newNode.next == nil {
                tail = newNode
            }
        }
        count += 1
    }

    /// Clears the list.
    public mutating func clear() {
        head = nil
        tail = nil
        count = 0
    }
    
    // MARK: - Sequence Protocol Conformance
    
    /// A Boolean value indicating whether the list is empty.
    public var isEmpty: Bool { return count == 0 }

    /// The number of elements in the list.
    public var size: Int { return count }

    /// Iterator allowing to iterate over the list elements.
    /// 
    /// Iterator will traverse the list from the beginning to the end.
    public struct LinkedListIterator: IteratorProtocol {
        private var current: Node?
        
        fileprivate init(startNode: Node?) {
            self.current = startNode
        }
        
        public mutating func next() -> T? {
            guard let node = current else { return nil }
            current = node.next
            return node.value
        }
    }
    
    /// Returns an iterator over the elements of the list.
    public func makeIterator() -> LinkedListIterator {
        return LinkedListIterator(startNode: head)
    }

    // MARK: - LinkedList Specific Methods

    /// Prepends an element to the beginning of the list.
    /// 
    /// This operation is optimized for linked lists and has `O(1)` time complexity.
    /// 
    /// - Parameter element: The element to prepend.
    public mutating func prepend(_ element: T) {
        let newNode = Node(value: element)
        newNode.next = head
        head = newNode
        if tail == nil { tail = newNode }
        count += 1
    }

    /// Prepends multiple elements to the beginning of the list.
    /// 
    /// This operation is optimized for linked lists and has `O(1)` time complexity.
    /// 
    /// - Parameter elements: The elements to prepend.
    public mutating func prepend(_ elements: [T]) {
        for element in elements {
            prepend(element)
        }
    }

    /// Prepends multiple elements to the beginning of the list.
    /// 
    /// This operation is optimized for linked lists and has `O(1)` time complexity.
    /// 
    /// - Parameter elements: The elements to prepend.
    public mutating func prepend(_ elements: T...) {
        prepend(elements)
    }
    
    /// Prepends another linked list to the beginning of the list.
    /// 
    /// This operation is optimized for linked lists and has `O(1)` time complexity.
    /// 
    /// - Parameter list: The list to prepend.
    public mutating func prepend(_ list: LinkedList<T>) {
        for element in list {
            prepend(element)
        }
    }

}