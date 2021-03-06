import XCTest
import SwiftAlgorithm

class DoubleStackQueue_Tests: XCTestCase {
        
    typealias Queue = DoubleStackQueue
    
    func testEnqueue() {
        var queue = Queue<Int>()
        var array = [Int]()
        let range = 0 ..< 10
        
        for element in range {
            queue.enqueue(element)
            array.append(element)
            XCTAssertEqual(queue.isEmpty, array.isEmpty)
            XCTAssertEqual(queue.count, array.count)
            XCTAssertEqual(queue.front, array.first)
            XCTAssertEqual(queue.back, array.last)
        }
    }
    
    func testDequeue() {
        var queue = Queue<Int>()
        var array = [Int]()
        let range = 0 ..< 10
        
        for element in range {
            queue.enqueue(element)
            array.append(element)
        }
        
        while !queue.isEmpty {
            XCTAssertEqual(queue.dequeue(), array.removeFirst())
            XCTAssertEqual(queue.isEmpty, array.isEmpty)
            XCTAssertEqual(queue.count, array.count)
            XCTAssertEqual(queue.front, array.first)
            XCTAssertEqual(queue.back, array.last)
        }
    }
    
    func testMemoryRelease() {
        class Wrapper<T> {
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
