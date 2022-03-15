import XCTest
@testable import SwiftAlgorithm

class LinkedListQueue_Tests: XCTestCase {
    
    typealias Queue = LinkedListQueue
    
    func testEnqueue() throws {
        let range = 0 ..< 10
        var array = [Int]()
        let queue = Queue<Int>()
        
        for element in range {
            queue.enqueue(element)
            array.append(element)
            
            XCTAssertEqual(queue.front, array.first)
            XCTAssertEqual(queue.back, array.last)
            XCTAssertEqual(queue.count, array.count)
            XCTAssertEqual(queue.isEmpty, array.isEmpty)
        }
    }
    
    func testDequeue() throws {
        let range = 0 ..< 10
        var array = range.map({ $0 })
        let queue = Queue<Int>(array)
        
        while !queue.isEmpty {
            XCTAssertEqual(queue.dequeue(), array.removeFirst())
            
            XCTAssertEqual(queue.front, array.first)
            XCTAssertEqual(queue.back, array.last)
            XCTAssertEqual(queue.count, array.count)
            XCTAssertEqual(queue.isEmpty, array.isEmpty)
        }
    }
    
    func testMemoryRelease() throws {
        final class Wrapper<T> {
            let value: T
            
            init(_ value: T) {
                self.value = value
            }
        }
        
        var queue: Queue<Wrapper<Int>>? = Queue<Wrapper<Int>>()
        queue?.enqueue(Wrapper(0))
        queue?.enqueue(Wrapper(1))
        weak var first = queue?.dequeue()
        weak var second = queue?.dequeue()
        queue = nil
        
        XCTAssertNil(first)
        XCTAssertNil(second)
    }
}
