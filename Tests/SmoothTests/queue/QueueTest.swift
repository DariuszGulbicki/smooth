import Testing
@testable import Basis

@Suite("Queue")
struct QueueTest {
    
    @Test("Queue initialization by init")
    func queueInitTest() async throws {
        let queue = Queue<Int>()
        #expect(queue.isEmpty, "Expected new queue to be empty")
    }

    @Test("Queue initialization by init with elements")
    func queueInitWithElementsTest() async throws {
        let queue = Queue<Int>(1, 2, 3, 4, 5)
        #expect(queue.count == 5, "Expected queue to have 5 elements")
    }

    @Test("Queue initialization by array literal")
    func queueInitWithArrayLiteralTest() async throws {
        let queue: Queue<Int> = [1, 2, 3, 4, 5]
        #expect(queue.count == 5, "Expected queue to have 5 elements")
    }

    @Test("Enqueue element to queue")
    func queueEnqueueElementTest() async throws {
        var queue = Queue<Int>()
        queue.enqueue(1)
        queue.enqueue(2)
        queue.enqueue(3)
    }

    @Test("Dequeue element from queue")
    func queueDequeueElementTest() async throws {
        var queue = Queue<Int>(1, 2, 3, 4, 5)
        let dequeued = queue.dequeue()
        #expect(dequeued == 1, "Expected 1 to be dequeued")
        #expect(queue.count == 4, "Expected queue to have 4 elements")
        let dequeued2 = queue.dequeue()
        #expect(dequeued2 == 2, "Expected 2 to be dequeued")
        #expect(queue.count == 3, "Expected queue to have 3 elements")
    }

    @Test("Peek element from queue")
    func queuePeekElementTest() async throws {
        let queue = Queue<Int>(1, 2, 3, 4, 5)
        #expect(queue.peek() == 1, "Expected 1 to be peeked")
        #expect(queue.count == 5, "Expected queue to have 5 elements")
    }

    @Test("Retrieve element at position from queue")
    func queueElementAtPositionTest() async throws {
        let queue = Queue<Int>(1, 2, 3, 4, 5)
        #expect(queue.element(at: 0) == 1, "Expected 1 at position 0")
        #expect(queue.element(at: 3) == 4, "Expected 4 at position 3")
        #expect(queue.element(at: 4) == 5, "Expected 5 at position 4")
        #expect(queue.element(at: 5) == nil, "Expected nil at out of bounds position")
    }

}