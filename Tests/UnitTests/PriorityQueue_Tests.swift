import XCTest
@testable import SwiftAlgorithm

class PriorityQueue_Tests: XCTestCase {
    
    private let list = [8, 6, 20, 17, 24, 21, 14, 15, 2, 7]
    
    func testEmpty() throws {
        let maxQueue = PriorityQueue<Int>(orderType: .max)
        XCTAssertTrue(maxQueue.isEmpty)
        XCTAssertEqual(maxQueue.count, 0)
        XCTAssertNil(maxQueue.peek)
        
        let minQueue = PriorityQueue<Int>(orderType: .min)
        XCTAssertTrue(minQueue.isEmpty)
        XCTAssertEqual(minQueue.count, 0)
        XCTAssertNil(minQueue.peek)
    }
    
    func testMaxQueue() throws {
        var maxArray = [Int]()
        var maxQueue = PriorityQueue<Int>(orderType: .max)
        
        // enqueue
        for element in list {
            maxArray.append(element)
            maxArray.sort(by: >)
            maxQueue.enqueue(element)
            XCTAssertEqual(maxArray.first, maxQueue.peek)
        }
        
        // dequeue
        for _ in 0 ..< maxArray.count {
            XCTAssertEqual(maxArray.removeFirst(), maxQueue.dequeue())
        }
    }
    
    func testMinQueue() throws {
        var minArray = [Int]()
        var minQueue = PriorityQueue<Int>(orderType: .min)
        
        // enqueue
        for element in list {
            minArray.append(element)
            minArray.sort(by: <)
            minQueue.enqueue(element)
            XCTAssertEqual(minArray.first, minQueue.peek)
        }
        
        // dequeue
        for _ in 0 ..< minArray.count {
            XCTAssertEqual(minArray.removeFirst(), minQueue.dequeue())
        }
    }
}
