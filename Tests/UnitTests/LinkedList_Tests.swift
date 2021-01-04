import XCTest
import SwiftAlgorithm

class LinkedList_Tests: XCTestCase {
    
    private let range = 0 ..< 10
    
    private func linkedList() -> LinkedList<Int> {
        let result = LinkedList<Int>()
        range.forEach { result.append($0) }
        return result
    }
    
    func testCount() {
        let list = linkedList()
        XCTAssertEqual(list.count, range.count)
    }

    func testSubscript() {
        let list = linkedList()
        for i in 0 ..< list.count {
            XCTAssertEqual(range[i], list[i])
        }
    }

    func testNodeAtIndex() {
        let list = linkedList()

        let first = list.node(at: 0)
        XCTAssertNotNil(first)
        XCTAssertTrue(first === list.head)
        XCTAssertEqual(first.element, range.first)

        let last = list.node(at: range.count - 1)
        XCTAssertNotNil(last)
        XCTAssertTrue(last === list.tail)
        XCTAssertEqual(last.element, range.last)

        for i in 0 ..< list.count {
            let node = list.node(at: i)
            XCTAssertNotNil(node)
            XCTAssertEqual(node.element, range[i])
        }
    }

    func testAppendElement() {
        let list = LinkedList<Int>()
        list.append(0)
        XCTAssertEqual(list[0], 0)
        list.append(1)
        XCTAssertEqual(list[1], 1)
        list.append(2)
        XCTAssertEqual(list[2], 2)
    }

    func testAppendNode() {
        let list = LinkedList<Int>()
        list.append(LinkedList<Int>.Node(element: 0))
        XCTAssertEqual(list[0], 0)
        list.append(LinkedList<Int>.Node(element: 1))
        XCTAssertEqual(list[1], 1)
        list.append(LinkedList<Int>.Node(element: 2))
        XCTAssertEqual(list[2], 2)
    }

    func testAppendList() {
        let list = linkedList()
        let countOfList = list.count

        // empty list
        let tmp = LinkedList<Int>()
        let countOfTmp = tmp.count
        list.append(tmp)
        XCTAssertEqual(list.count, countOfList + countOfTmp)

        // not empty list
        let tmp2 = LinkedList<Int>()
        (countOfList ..< countOfList + 10).forEach { tmp2.append($0) }
        let countOfTmp2 = tmp2.count
        list.append(tmp2)
        for i in 0 ..< countOfList + countOfTmp2 {
            if i < countOfList {
                XCTAssertEqual(list[i], range[i])

            } else {
                XCTAssertEqual(list[i], tmp2[i - countOfTmp2])
            }
        }
    }

    func testInsertElementAtIndex() {
        let list = LinkedList<Int>()

        // first insert
        let firstElement = 0
        list.insert(firstElement, at: 0)
        XCTAssertEqual(list.count, 1)
        XCTAssertEqual(list[0], firstElement)
        XCTAssertEqual(list.head?.element, firstElement)

        // second insert
        let secondElement = 1
        list.insert(secondElement, at: 0)
        XCTAssertEqual(list.count, 2)
        XCTAssertEqual(list[0], secondElement)
        XCTAssertEqual(list.head?.element, secondElement)
        
        // last insert
        let lastElement = 2
        list.insert(lastElement, at: list.count)
        XCTAssertEqual(list.count, 3)
        XCTAssertEqual(list[list.count - 1], lastElement)
        XCTAssertEqual(list.tail?.element, lastElement)
    }

    func testInsertNodeAtIndex() {
        let list = LinkedList<Int>()

        // first insert
        let first = LinkedList<Int>.Node(element: 0)
        list.insert(first, at: 0)
        XCTAssertEqual(list.count, 1)
        XCTAssertEqual(list[0], first.element)
        XCTAssertTrue(list.head === first)

        // second insert
        let second = LinkedList<Int>.Node(element: 1)
        list.insert(second, at: 0)
        XCTAssertEqual(list.count, 2)
        XCTAssertEqual(list[0], second.element)
        XCTAssertTrue(list.head === second)
        
        // last insert
        let last = LinkedList<Int>.Node(element: 2)
        list.insert(last, at: list.count)
        XCTAssertEqual(list.count, 3)
        XCTAssertEqual(list[list.count - 1], last.element)
        XCTAssertTrue(list.tail === last)
    }

    func testInsertListAtIndex() {
        let list = linkedList()
        let countOfList = list.count

        // empty list
        let tmp = LinkedList<Int>()
        let countOfTmp = tmp.count
        list.insert(tmp, at: 0)
        XCTAssertEqual(list.count, countOfList + countOfTmp)

        // not empty list
        let tmp2 = LinkedList<Int>()
        (countOfList ..< countOfList + 10).forEach { tmp2.append($0) }
        let countOfTmp2 = tmp2.count
        list.insert(tmp2, at: 0)
        for i in 0 ..< countOfList + countOfTmp2 {
            if i < countOfTmp2 {
                XCTAssertEqual(list[i], tmp2[i])

            } else {
                XCTAssertEqual(list[i], range[i - countOfTmp2])
            }
        }
    }
    
    func testRemoveAll() {
        let list = linkedList()
        
        list.removeAll()
        XCTAssertEqual(list.count, 0)
        XCTAssertNil(list.head)
        XCTAssertNil(list.tail)
    }
    
    func testRemoveNode() {
        let list = linkedList()
        var numbers = list.map({ $0 })
        
        // first remove
        if let first = list.head {
            XCTAssertEqual(list.remove(first), numbers.removeFirst())
            XCTAssertEqual(list.count, numbers.count)
            for i in 0 ..< list.count {
                XCTAssertEqual(list.node(at: i).element, numbers[i])
            }
        }
        
        // last remove
        if let last = list.tail {
            XCTAssertEqual(list.remove(last), numbers.removeLast())
            XCTAssertEqual(list.count, numbers.count)
            for i in 0 ..< list.count {
                XCTAssertEqual(list.node(at: i).element, numbers[i])
            }
        }
        
        // random remove
        let deleteIndexs = Int.random(in: 0 ..< list.count)
        let node = list.node(at: deleteIndexs)
        list.remove(node)
        numbers.remove(at: deleteIndexs)
        for i in 0 ..< numbers.count {
            XCTAssertEqual(list[i], numbers[i])
        }
    }
    
    func testRemoveAtIndex() {
        let list = linkedList()
        var numbers = list.map({ $0 })
        
        // first remove
        let firstIndex = 0
        XCTAssertEqual(list.remove(at: firstIndex), numbers.remove(at: firstIndex))
        XCTAssertEqual(list.count, numbers.count)
        for i in 0 ..< list.count {
            XCTAssertEqual(list.node(at: i).element, numbers[i])
        }
        
        // last remove
        let lastIndex = list.count - 1
        XCTAssertEqual(list.remove(at: lastIndex), numbers.remove(at: lastIndex))
        XCTAssertEqual(list.count, numbers.count)
        for i in 0 ..< list.count {
            XCTAssertEqual(list.node(at: i).element, numbers[i])
        }
        
        // random remove
        let deleteIndexs = Int.random(in: 0 ..< list.count)
        list.remove(at: deleteIndexs)
        numbers.remove(at: deleteIndexs)
        for i in 0 ..< list.count {
            XCTAssertEqual(list.node(at: i).element, numbers[i])
        }
    }
    
    func testRemoveFirst() {
        let list = linkedList()
        var numbers = list.map({ $0 })
        
        // first remove
        XCTAssertEqual(list.removeFirst(), numbers.removeFirst())
        XCTAssertEqual(list.count, numbers.count)
        for i in 0 ..< list.count {
            XCTAssertEqual(list.node(at: i).element, numbers[i])
        }
    }
    
    func testRemoveLast() {
        let list = linkedList()
        var numbers = list.map({ $0 })
        
        // last remove
        XCTAssertEqual(list.removeLast(), numbers.removeLast())
        XCTAssertEqual(list.count, numbers.count)
        for i in 0 ..< list.count {
            XCTAssertEqual(list.node(at: i).element, numbers[i])
        }
    }
    
    func testMemoryRelease() {
        var list: LinkedList<Int>? = linkedList()
        weak var first = list?.head
        weak var last = list?.tail
        list = nil
        
        XCTAssertNil(first)
        XCTAssertNil(last)
    }
}
