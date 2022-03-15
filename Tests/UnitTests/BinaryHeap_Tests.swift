import XCTest
@testable import SwiftAlgorithm

class BinaryHeap_Tests: XCTestCase {
    
    private typealias Heap = BinaryHeap
    
    private let list0 = [8, 6, 20, 17, 24, 21, 14, 15, 2, 7]
    private let list1 = [10, 5, 12, 19, 0, 11, 23, 16, 13, 1]
    private var baseKey: Int {
        return list0[3]
    }
    
    // Common Heap test
    
    func testEmpty() throws {
        let maxHeap = Heap<Int>(orderType: .max)
        XCTAssertTrue(maxHeap.isEmpty)
        XCTAssertEqual(maxHeap.count, 0)
        XCTAssertNil(maxHeap.peek)
        
        let minHeap = Heap<Int>(orderType: .max)
        XCTAssertTrue(minHeap.isEmpty)
        XCTAssertEqual(minHeap.count, 0)
        XCTAssertNil(minHeap.peek)
    }
    
    // Max Heap test
    
    func testMaxHeap_Build() throws {
        var maxArray = list0.sorted(by: >)
        var maxHeap = Heap<Int>(orderType: .max, array: list0)
        
        // extract
        for _ in 0 ..< maxHeap.count {
            XCTAssertEqual(maxArray.removeFirst(), maxHeap.extract())
        }
    }
    
    func testMaxHeap_insert() throws {
        var maxArray = [Int]()
        var maxHeap = Heap<Int>(orderType: .max)
        
        // insert
        for element in list0 {
            maxArray.append(element)
            maxArray.sort(by: >)
            maxHeap.insert(element)
            XCTAssertEqual(maxArray.first, maxHeap.peek)
        }
    }
    
    func testMaxHeap_extract() throws {
        var maxArray = [Int]()
        var maxHeap = Heap<Int>(orderType: .max)
        
        // insert
        for element in list0 {
            maxArray.append(element)
            maxArray.sort(by: >)
            maxHeap.insert(element)
            XCTAssertEqual(maxArray.first, maxHeap.peek)
        }
        
        // extract
        for _ in 0 ..< maxHeap.count {
            XCTAssertEqual(maxArray.removeFirst(), maxHeap.extract())
        }
    }
    
    func testMaxHeap_insertThenExtract() throws {
        var maxArray = list0.sorted(by: >)
        var maxHeap = Heap<Int>(orderType: .max, array: list0)
        
        // insertThenExtract
        for element in list1 {
            maxArray.append(element)
            maxArray.sort(by: >)
            XCTAssertEqual(maxArray.removeFirst(), maxHeap.insertThenExtract(element))
            XCTAssertEqual(maxArray.first, maxHeap.peek)
        }
    }
    
    func testMaxHeap_extractThenInsert() throws {
        var maxArray = list0.sorted(by: >)
        var maxHeap = Heap<Int>(orderType: .max, array: list0)
        
        // extractThenInsert
        for element in list1 {
            XCTAssertEqual(maxArray.removeFirst(), maxHeap.extractThenInsert(element))
            maxArray.append(element)
            maxArray.sort(by: >)
            XCTAssertEqual(maxArray.first, maxHeap.peek)
        }
    }
    
    func testMaxHeap_findIndex_remove() throws {
        var maxArray = list0.sorted(by: >)
        var maxHeap = Heap<Int>(orderType: .max, array: list0)
        
        // array, minHeap remove
        let baseIndex = 3
        let base = maxArray[baseIndex]
        maxArray.remove(at: baseIndex)
        let index = maxHeap.firstIndex(of: base)!
        maxHeap.remove(at: index)
        
        // extract
        for _ in 0 ..< maxHeap.count {
            XCTAssertEqual(maxArray.removeFirst(), maxHeap.extract())
        }
    }
    
    func testMaxHeap_decreaseKey_udtate() throws {
        var maxArray = list0.sorted(by: >)
        var maxHeap = Heap<Int>(orderType: .max, array: list0)
        
        let decreaseKey = baseKey - 3
        let indexOfArray = maxArray.firstIndex(of: baseKey)!
        let indexOfHeap = maxHeap.firstIndex(of: baseKey)!
        
        maxArray[indexOfArray] = decreaseKey
        maxHeap.update(at: indexOfHeap, element: decreaseKey)
        maxArray.sort(by: >)
        
        // extract
        for _ in 0 ..< maxHeap.count {
            XCTAssertEqual(maxArray.removeFirst(), maxHeap.extract())
        }
    }
    
    func testMaxHeap_increaseKey_udtate() throws {
        var maxArray = list0.sorted(by: >)
        var maxHeap = Heap<Int>(orderType: .max, array: list0)
        
        let increaseKey = baseKey + 3
        let indexOfArray = maxArray.firstIndex(of: baseKey)!
        let indexOfHeap = maxHeap.firstIndex(of: baseKey)!
        
        maxArray[indexOfArray] = increaseKey
        maxHeap.update(at: indexOfHeap, element: increaseKey)
        maxArray.sort(by: >)
        
        // extract
        for _ in 0 ..< maxHeap.count {
            XCTAssertEqual(maxArray.removeFirst(), maxHeap.extract())
        }
    }
    
    // Min Heap test
    
    func testMinHeap_Build() throws {
        var minArray = list0.sorted(by: <)
        var minHeap = Heap<Int>(orderType: .min, array: list0)
        
        // extract
        for _ in 0 ..< minHeap.count {
            XCTAssertEqual(minArray.removeFirst(), minHeap.extract())
        }
    }
    
    func testMinHeap_insert() throws {
        var minArray = [Int]()
        var minHeap = Heap<Int>(orderType: .min)
        
        // insert
        for element in list0 {
            minArray.append(element)
            minArray.sort(by: <)
            minHeap.insert(element)
            XCTAssertEqual(minArray.first, minHeap.peek)
        }
    }
    
    func testMinHeap_extract() throws {
        var minArray = [Int]()
        var minHeap = Heap<Int>(orderType: .min)
        
        // insert
        for element in list0 {
            minArray.append(element)
            minArray.sort(by: <)
            minHeap.insert(element)
            XCTAssertEqual(minArray.first, minHeap.peek)
        }
        
        // extract
        for _ in 0 ..< minHeap.count {
            XCTAssertEqual(minArray.removeFirst(), minHeap.extract())
        }
    }
    
    func testMinHeap_insertThenExtract() throws {
        var minArray = list0.sorted(by: <)
        var minHeap = Heap<Int>(orderType: .min, array: list0)
        
        // insertThenExtract
        for element in list1 {
            minArray.append(element)
            minArray.sort(by: <)
            XCTAssertEqual(minArray.removeFirst(), minHeap.insertThenExtract(element))
            XCTAssertEqual(minArray.first, minHeap.peek)
        }
    }
    
    func testMinHeap_extractThenInsert() throws {
        var minArray = list0.sorted(by: <)
        var minHeap = Heap<Int>(orderType: .min, array: list0)
        
        // extractThenInsert
        for element in list1 {
            XCTAssertEqual(minArray.removeFirst(), minHeap.extractThenInsert(element))
            minArray.append(element)
            minArray.sort(by: <)
            XCTAssertEqual(minArray.first, minHeap.peek)
        }
    }
    
    func testMinHeap_findIndex_remove() throws {
        var minArray = list0.sorted(by: <)
        var minHeap = Heap<Int>(orderType: .min, array: list0)
        
        // array, minHeap remove
        let baseIndex = 3
        let base = minArray[baseIndex]
        minArray.remove(at: baseIndex)
        let index = minHeap.firstIndex(of: base)!
        minHeap.remove(at: index)
        
        // extract
        for _ in 0 ..< minHeap.count {
            XCTAssertEqual(minArray.removeFirst(), minHeap.extract())
        }
    }
    
    func testMinHeap_decreaseKey_udtate() throws {
        var minArray = list0.sorted(by: <)
        var minHeap = Heap<Int>(orderType: .min, array: list0)
        
        let decreaseKey = baseKey - 3
        let indexOfArray = minArray.firstIndex(of: baseKey)!
        let indexOfHeap = minHeap.firstIndex(of: baseKey)!
        
        minArray[indexOfArray] = decreaseKey
        minHeap.update(at: indexOfHeap, element: decreaseKey)
        minArray.sort(by: <)
        
        // extract
        for _ in 0 ..< minHeap.count {
            XCTAssertEqual(minArray.removeFirst(), minHeap.extract())
        }
    }
    
    func testMinHeap_increaseKey_udtate() throws {
        var minArray = list0.sorted(by: <)
        var minHeap = Heap<Int>(orderType: .min, array: list0)
        
        let increaseKey = baseKey + 3
        let indexOfArray = minArray.firstIndex(of: baseKey)!
        let indexOfHeap = minHeap.firstIndex(of: baseKey)!
        
        minArray[indexOfArray] = increaseKey
        minHeap.update(at: indexOfHeap, element: increaseKey)
        minArray.sort(by: <)
        
        // extract
        for _ in 0 ..< minHeap.count {
            XCTAssertEqual(minArray.removeFirst(), minHeap.extract())
        }
    }
}
