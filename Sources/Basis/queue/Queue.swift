/// # Queue
/// 
/// Basic FIFO queue implementation.
/// 
/// Used to store elements in a first-in-first-out order.
/// 
/// Similar to `LinkedList` but with an array-based implementation.
/// This results in better performance when access to specific element in the middle
/// of the queue is needed and better cache performance.
/// However, for more dynamic use cases, `LinkedQueue` might be a better choice.
/// 
/// By default, this implementation uses compaction to improve performance.
/// Compaction can be adjusted by setting `compactionThreshold` variable.
/// You can also disable compaction by setting `compactionThreshold` to `0` (NOT RECOMMENDED).
/// 
/// ## Performance
/// 
/// - Enqueuing: `O(1)`
/// - Dequeuing: `O(1)` or `O(n)` if compaction is needed.
/// - Peeking: `O(1)`
/// - Counting: `O(1)`
/// - Clearing: `O(1)`
/// 
/// ## Example
/// 
/// ```swift
/// var queue = Queue<Int>()
/// queue.enqueue(1)
/// queue.enqueue(2)
/// queue.enqueue(3)
/// 
/// print(queue.dequeue()) // 1
/// print(queue.dequeue()) // 2
/// print(queue.dequeue()) // 3
/// print(queue.dequeue()) // nil
/// ```
public struct Queue<QueueType>: QueueLike {

    public init() {
        
    }

    private var _compactionThreshold = 50

    /// The number of elements that can be dequeued before the queue is compacted. 
    /// Defaults to 50.
    /// 
    /// Queues use compaction to improve performance by avoiding shifting elements
    /// when dequeuing.
    /// 
    /// The queue simply ignores dequeued elemnts instead of removing them.
    /// This results in `O(1)` performance for dequeuing elements.
    /// When the number of dequeued elements reaches the compaction threshold, the
    /// queue will remove the dequeued elements from the beginning of the queue.
    /// Operation is `O(n)` where n is the number of dequeued elements.
    /// 
    /// Setting this variable to higher values will result in better performance for
    /// enqueuing and dequeuing elements, but will consume more memory.
    /// 
    /// You can set this variable to `0` to disable compaction.
    /// Disabling compaction is not recommended since it will result in possible
    /// high memory usage. If you don't want to use compaction, you can compact a
    /// queue manually by calling `compact()` or dequeue an element with
    /// automatically compacting the queue by calling `dequeueCompacting()`.
    public var compactionThreshold: Int {
        get {
            return _compactionThreshold
        }
        set {
            _compactionThreshold = (newValue < 0) ? 0 : newValue
        }
    }

    private var elements: ArraySlice<QueueType> = []
    private var frontIndex = 0

    /// A Boolean value indicating whether the queue is empty.
    public var isEmpty: Bool {
        return frontIndex >= elements.count
    }

    /// The number of elements in the queue.
    public var count: Int {
        return elements.count - frontIndex
    }

    /// Adds an element to the end of the queue.
    /// 
    /// - Parameter item: The element to add to the queue.
    public mutating func enqueue(_ item: QueueType) {
        elements.append(item)
    }

    /// Removes and returns the first element in the queue.
    /// 
    /// Automatically compacts the queue when the compaction threshold is reached.
    /// 
    /// - Returns: The first element in the queue or `nil` if the queue is empty.
    public mutating func dequeue() -> QueueType? {
        guard frontIndex < elements.count else { return nil }
        let element = elements[frontIndex]
        frontIndex += 1
        if frontIndex > 50 {
            elements = elements[frontIndex...]
            frontIndex = 0
        }
        return element
    }

    /// Retrieves the first element in the queue without removing it.
    /// 
    /// - Returns: The first element in the queue or `nil` if the queue is empty.
    public func peek() -> QueueType? {
        return isEmpty ? nil : elements[frontIndex]
    }

    /// Retrieves an element at a specific index in the queue.
    /// 
    /// - Parameter index: The index of the element to retrieve.
    /// - Returns: The element at the specified index or `nil` if the index is out of bounds.
    ///     
    /// - Complexity: `O(1)`
    public func element(at index: Int) -> QueueType? {
        guard index >= 0 && index < count else { return nil }
        return elements[frontIndex + index]
    }

    /// Removes all elements from the queue.
    public mutating func clear() {
        elements = []
        frontIndex = 0
    }

    /// Manually compacts the queue by removing dequeued elements.
    /// 
    /// Usually, calling this method is not needed since by default the queue will
    /// automatically compact itself when the compaction threshold is reached.
    public mutating func compact() {
        if frontIndex > 0 {
            elements = elements[frontIndex...]
            frontIndex = 0
        }
    }

    /// Dequeues an element and compacts the queue ignoring the compaction threshold.
    /// 
    /// Calling this method is not recommended since it will result in poorer performance
    /// than using the default compaction mechanism.
    /// 
    /// Use this method only when you need to free memory immediately or when compaction
    /// mechanism is disabled.
    public mutating func dequeueCompacting() -> QueueType? {
        guard frontIndex < elements.count else { return nil }
        let element = elements[frontIndex]
        frontIndex += 1
        compact()
        return element
    }

}