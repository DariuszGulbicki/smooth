/// # QueueLike
/// 
/// A protocol for queue-like data structures.
/// Base for all queue implementations.
/// 
/// Each queue can be expressed as an array literal.
/// 
/// ## Imlpementations
/// 
/// - `Queue`: A simple FIFO queue implementation based on array.
/// - `LinkedQueue`: A simple FIFO queue implementation based on linked list.
/// 
/// ## Example
/// 
/// ```swift
/// var queue: QueueLike<Int> = Queue(fromArray: [1, 2, 3])
/// 
/// print(queue.dequeue()) // 1
/// print(queue.dequeue()) // 2
/// print(queue.dequeue()) // 3
/// print(queue.dequeue()) // nil
/// ```
public protocol QueueLike<QueueType>: ExpressibleByArrayLiteral {

    associatedtype QueueType

    init()
    
    init(fromArray array: [QueueType])

    var isEmpty: Bool { get}
    
    var count: Int { get }
    
    mutating func enqueue(_ item: QueueType)
    
    mutating func dequeue() -> QueueType?
    
    func peek() -> QueueType?

    func element(at index: Int) -> QueueType?
    
    mutating func clear()
}

extension QueueLike {

    public init(_ elements: QueueType...) {
        self.init(fromArray: elements)
    }

    public init(fromArray array: [QueueType]) {
        self.init()
        for item in array {
            self.enqueue(item)
        }
    }

    public init(arrayLiteral elements: QueueType...) {
        self.init(fromArray: elements)
    }
}