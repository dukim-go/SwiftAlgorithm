import XCTest
@testable import SwiftAlgorithm

class Combinations_Tests: XCTestCase {
    
    private let list = [0, 1, 2]
    
    private func factorial(n: Int) -> Int {
        if n > 0 {
            return n * factorial(n: n - 1)
            
        } else {
            return 1
        }
    }
    
    func testCombinations() throws {
        let count = list.count
        
        let count0 = count
        let combinations0 = list.combinations() // or combinations(ofCount: count0)
        XCTAssertEqual(combinations0.count, factorial(n: count) / (factorial(n: count - count0) * factorial(n: count0)))
        XCTAssertEqual(combinations0[0], [0, 1, 2])
        
        let count1 = count - 1
        let combinations1 = list.combinations(ofCount: count1)
        XCTAssertEqual(combinations1.count, factorial(n: count) / (factorial(n: count - count1) * factorial(n: count1)))
        XCTAssertEqual(combinations1[0], [0, 1])
        XCTAssertEqual(combinations1[1], [0, 2])
        XCTAssertEqual(combinations1[2], [1, 2])
        
        let count2 = count - 2
        let combinations2 = list.permutations(ofCount: count2)
        XCTAssertEqual(combinations2.count, factorial(n: count) / (factorial(n: count - count2) * factorial(n: count2)))
        XCTAssertEqual(combinations2[0], [0])
        XCTAssertEqual(combinations2[1], [1])
        XCTAssertEqual(combinations2[2], [2])
    }
    
    func testCombinationsWithRepetition() throws {
        let count = list.count
        
        let count0 = count + 1
        let combinationsWithRepetition0 = list.combinationsWithRepetition(ofCount: count0)
        XCTAssertEqual(combinationsWithRepetition0.count, factorial(n: count + count0 - 1) / (factorial(n: count - 1) * factorial(n: count0)))
        XCTAssertEqual(combinationsWithRepetition0[0], [0, 0, 0, 0])
        XCTAssertEqual(combinationsWithRepetition0[1], [0, 0, 0, 1])
        XCTAssertEqual(combinationsWithRepetition0[2], [0, 0, 0, 2])
        XCTAssertEqual(combinationsWithRepetition0[3], [0, 0, 1, 1])
        XCTAssertEqual(combinationsWithRepetition0[4], [0, 0, 1, 2])
        XCTAssertEqual(combinationsWithRepetition0[5], [0, 0, 2, 2])
        XCTAssertEqual(combinationsWithRepetition0[6], [0, 1, 1, 1])
        XCTAssertEqual(combinationsWithRepetition0[7], [0, 1, 1, 2])
        XCTAssertEqual(combinationsWithRepetition0[8], [0, 1, 2, 2])
        XCTAssertEqual(combinationsWithRepetition0[9], [0, 2, 2, 2])
        XCTAssertEqual(combinationsWithRepetition0[10], [1, 1, 1, 1])
        XCTAssertEqual(combinationsWithRepetition0[11], [1, 1, 1, 2])
        XCTAssertEqual(combinationsWithRepetition0[12], [1, 1, 2, 2])
        XCTAssertEqual(combinationsWithRepetition0[13], [1, 2, 2, 2])
        XCTAssertEqual(combinationsWithRepetition0[14], [2, 2, 2, 2])
        
        let count1 = count
        let combinationsWithRepetition1 = list.combinationsWithRepetition(ofCount: count1) // or combinationsWithRepetition(ofCount: count1)
        XCTAssertEqual(combinationsWithRepetition1.count, factorial(n: count + count1 - 1) / (factorial(n: count - 1) * factorial(n: count1)))
        XCTAssertEqual(combinationsWithRepetition1[0], [0, 0, 0])
        XCTAssertEqual(combinationsWithRepetition1[1], [0, 0, 1])
        XCTAssertEqual(combinationsWithRepetition1[2], [0, 0, 2])
        XCTAssertEqual(combinationsWithRepetition1[3], [0, 1, 1])
        XCTAssertEqual(combinationsWithRepetition1[4], [0, 1, 2])
        XCTAssertEqual(combinationsWithRepetition1[5], [0, 2, 2])
        XCTAssertEqual(combinationsWithRepetition1[6], [1, 1, 1])
        XCTAssertEqual(combinationsWithRepetition1[7], [1, 1, 2])
        XCTAssertEqual(combinationsWithRepetition1[8], [1, 2, 2])
        XCTAssertEqual(combinationsWithRepetition1[9], [2, 2, 2])
        
        let count2 = count - 1
        let combinationsWithRepetition2 = list.combinationsWithRepetition(ofCount: count2)
        XCTAssertEqual(combinationsWithRepetition2.count, factorial(n: count + count2 - 1) / (factorial(n: count - 1) * factorial(n: count2)))
        XCTAssertEqual(combinationsWithRepetition2[0], [0, 0])
        XCTAssertEqual(combinationsWithRepetition2[1], [0, 1])
        XCTAssertEqual(combinationsWithRepetition2[2], [0, 2])
        XCTAssertEqual(combinationsWithRepetition2[3], [1, 1])
        XCTAssertEqual(combinationsWithRepetition2[4], [1, 2])
        XCTAssertEqual(combinationsWithRepetition2[5], [2, 2])
        
        let count3 = count - 2
        let combinationsWithRepetition3 = list.combinationsWithRepetition(ofCount: count3)
        XCTAssertEqual(combinationsWithRepetition3.count, factorial(n: count + count3 - 1) / (factorial(n: count - 1) * factorial(n: count3)))
        XCTAssertEqual(combinationsWithRepetition3[0], [0])
        XCTAssertEqual(combinationsWithRepetition3[1], [1])
        XCTAssertEqual(combinationsWithRepetition3[2], [2])
    }
}
