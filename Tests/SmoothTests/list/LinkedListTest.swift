import Testing
@testable import Basis

@Suite("LinkedList")
struct ListTests {
    
    @Test("List initialization by init")
    func listInitTest() async throws {
        let list = LinkedList<Int>()
        #expect(list.isEmpty, "Expected new list to be empty")
    }

    @Test("List initialization by init with elements")
    func listInitWithElementsTest() async throws {
        let list = LinkedList<Int>(1, 2, 3, 4, 5)
        #expect(list.size == 5, "Expected list to have 5 elements")
    }

    @Test("List initialization by array literal")
    func listInitWithArrayLiteralTest() async throws {
        let list: LinkedList<Int> = [1, 2, 3, 4, 5]
        #expect(list.size == 5, "Expected list to have 5 elements")
    }

    @Test("Add element to list")
    func listAddElementTest() async throws {
        var list = LinkedList<Int>()
        list.add(1)
        list.add(2)
        list.add(3)
        #expect(list.size == 3, "Expected list to have 3 elements")
    }

    @Test("Append element to list")
    func listAppendElementTest() async throws {
        var list = LinkedList<Int>()
        list.append(1)
        list.append(2)
        list.append(3)
        #expect(list.size == 3, "Expected list to have 3 elements")
    }

    @Test("Append list to list")
    func listAppendListTest() async throws {
        var list1 = LinkedList<Int>(1, 2, 3)
        let list2 = LinkedList<Int>(4, 5, 6)
        list1.append(list2)
        #expect(list1.size == 6, "Expected list to have 6 elements")
    }

    @Test("Append elements to list")
    func listAppendElementsTest() async throws {
        var list = LinkedList<Int>(1, 2, 3)
        list.append([4, 5, 6])
        #expect(list.size == 6, "Expected list to have 6 elements")

    }

    @Test("Prepend element to list")
    func listPrependElementTest() async throws {
        var list = LinkedList<Int>(1, 2, 3)
        list.prepend(0)
        #expect(list.size == 4, "Expected list to have 4 elements")
    }

    @Test("Prepend element to empty list")
    func listPrependElementToEmptyListTest() async throws {
        var list = LinkedList<Int>()
        list.prepend(0)
        #expect(list.size == 1, "Expected list to have 1 element")
    }

    @Test("Prepend multiple elements to list")
    func listPrependMultipleElementsTest() async throws {
        var list = LinkedList<Int>(3, 4, 5)
        list.prepend(1, 2, 3)
        #expect(list.size == 6, "Expected list to have 6 elements")
    }

    @Test("Prepend list to list")
    func listPrependListTest() async throws {
        var list1 = LinkedList<Int>(4, 5, 6)
        let list2 = LinkedList<Int>(1, 2, 3)
        list1.prepend(list2)
        #expect(list1.size == 6, "Expected list to have 6 elements")
    }

    @Test("Retrieve element from list")
    func listGetElementTest() async throws {
        let list = LinkedList<Int>(1, 2, 3, 4, 5)
        #expect(list.get(at: 0) == 1, "Expected 1 for first index (index 0)")
        #expect(list.get(at: 4) == 5, "Expected 5 for last index (index 4)")
        #expect(list.get(at: 5) == nil, "Expected nil for out of bounds index")
    }

    @Test("Remove element from list")
    func listRemoveElementTest() async throws {
        var list = LinkedList<Int>(1, 2, 3, 4, 5)
        let removed = list.remove(at: 2)
        #expect(removed == 3, "Expected 3 to be removed")
        #expect(list.get(at: 2) == 4, "Expected 4 to be at index 2")
    }

    @Test("Insert element into list")
    func listInsertElementTest() async throws {
        var list = LinkedList<Int>(1, 2, 3, 4, 5)
        list.insert(10, at: 2)
        #expect(list.get(at: 2) == 10, "Expected 10 to be at index 2")
    }

    @Test("List isEmpty")
    func listIsEmptyTest() async throws {
        var list = LinkedList<Int>()
        #expect(list.isEmpty, "Expected list to be empty")
        list.add(1)
        #expect(!list.isEmpty, "Expected list to not be empty")
    }

    @Test("List size")
    func listSizeTest() async throws {
        var list = LinkedList<Int>()
        #expect(list.size == 0, "Expected list size to be 0")
        list.add(1)
        #expect(list.size == 1, "Expected list size to be 1")
        list.add(2)
        #expect(list.size == 2, "Expected list size to be 2")
    }

    @Test("List iteration")
    func listIterationTest() async throws {
        let list = LinkedList<Int>(1, 2, 3, 4, 5)
        // use expects
        // no prints
        for (index, element) in list.enumerated() {
            #expect(element == index + 1, "Expected element to be index + 1")
        }
    }

    @Test("List iteration with for each")
    func listForEachTest() async throws {
        let list = LinkedList<Int>(1, 2, 3, 4, 5)
        var iterationsCount = 0
        list.forEach { element in
            #expect(element == iterationsCount + 1, "Expected element to be iterationsCount + 1")
            iterationsCount += 1
        }
    }

    @Test("List clear")
    func listClearTest() async throws {
        var list = LinkedList<Int>(1, 2, 3, 4, 5)
        list.clear()
        #expect(list.isEmpty, "Expected list to be empty after clear")
    }

}