import XCTest
import SwiftAlgorithm

class Queue_Tests: XCTestCase {
    
    private let range = 0 ..< 10
    
    private func queue() -> Queue<Int> {
        let result = Queue<Int>()
        range.forEach { result.enqueue($0) }
        return result
    }
    
    private func array() -> [Int] {
        var result = [Int]()
        range.forEach { result.append($0) }
        return result
    }
    
    override func setUpWithError() throws {
        
    }
    
    override func tearDownWithError() throws {
        
    }
    
    func testEnqueue() {
        let queue = Queue<Int>()
        var array = [Int]()
        let range = 0 ..< 10
        
        for element in range {
            queue.enqueue(element)
            array.append(element)
            XCTAssertEqual(queue.count, array.count)
            XCTAssertEqual(queue.front, array.first)
        }
    }
    
    func testDequeue() {
        let queue = Queue<Int>()
        var array = [Int]()
        let range = 0 ..< 10
        
        for element in range {
            queue.enqueue(element)
            array.append(element)
        }
        
        while !queue.isEmpty {
            XCTAssertEqual(queue.dequeue(), array.removeFirst())
            XCTAssertEqual(queue.count, array.count)
            XCTAssertEqual(queue.front, array.first)
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
