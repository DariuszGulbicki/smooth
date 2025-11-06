/// # LinkedQueue
/// 
/// FIFO queue implementation based on linked list.
/// 
/// Used to store elements in a first-in-first-out order.
/// Wraps `LinkedList` to provide queue-like functionality.
/// 
/// Better suited for dynamic use cases where elements are frequently added and removed
/// from the simple `Queue`. Also avoids compaction overhead.
/// 
/// ## Performance
/// 
/// - Enqueuing: `O(1)`
/// - Dequeuing: `O(1)`
/// - Peeking: `O(1)`
/// - Counting: `O(1)`
/// - Clearing: `O(1)`
/// 
/// ## Example
/// 
/// ```swift
/// var queue = LinkedQueue<Int>()
/// queue.enqueue(1)
/// queue.enqueue(2)
/// queue.enqueue(3)
/// 
/// print(queue.dequeue()) // 1
/// print(queue.dequeue()) // 2
/// print(queue.dequeue()) // 3
/// print(queue.dequeue()) // nil
/// ```
public struct LinkedQueue<QueueType>: QueueLike {
    
    /// The linked list used to store elements.
    private var elements: LinkedList<QueueType> = LinkedList()

    /// Creates an empty queue.
    public init() {
        
    }

    /// A Boolean value indicating whether the queue is empty.
    public var isEmpty: Bool {
        return elements.isEmpty
    }

    /// The number of elements in the queue.
    public var count: Int {
        return elements.size
    }

    /// Adds an element to the end of the queue.
    ///
    /// - Parameter item: The element to add to the queue.
    public mutating func enqueue(_ item: QueueType) {
        elements.add(item)
    }

    /// Removes and returns the first element in the queue.
    /// 
    /// - Returns: The first element in the queue or `nil` if the queue is empty.
    public mutating func dequeue() -> QueueType? {
        return elements.removeFirst()
    }

    /// Retrieves the first element in the queue without removing it.
    /// 
    /// - Returns: The first element in the queue or `nil` if the queue is empty.
    public func peek() -> QueueType? {
        return elements.first
    }

    /// Retrieves an element at a specific index in the queue.
    /// 
    /// - Parameter index: The index of the element to retrieve.
    public func element(at index: Int) -> QueueType? {
        return elements.get(at: index)
    }
    
    /// Removes all elements from the queue.
    public mutating func clear() {
        elements.clear()
    }

}