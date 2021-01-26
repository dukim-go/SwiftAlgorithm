import XCTest
import SwiftAlgorithm

class Permutations_Tests: XCTestCase {
    
    private let list = [0, 1, 2]
    
    private func factorial(n: Int) -> Int {
        if n > 0 {
            return n * factorial(n: n - 1)
            
        } else {
            return 1
        }
    }
    
    private func exponentiation(n: Int, r: Int) -> Int {
        return Int(pow(Double(n), Double(r)))
    }
    
    func testPermutations() {
        let count = list.count
        
        let count0 = count
        let permutations0 = list.permutations() // or permutations(ofCount: count0)
        XCTAssertEqual(permutations0.count, factorial(n: count) / factorial(n: count - count0))
        XCTAssertEqual(permutations0[0], [0, 1, 2])
        XCTAssertEqual(permutations0[1], [0, 2, 1])
        XCTAssertEqual(permutations0[2], [1, 0, 2])
        XCTAssertEqual(permutations0[3], [1, 2, 0])
        XCTAssertEqual(permutations0[4], [2, 0, 1])
        XCTAssertEqual(permutations0[5], [2, 1, 0])
        
        let count1 = count - 1
        let permutations1 = list.permutations(ofCount: count1)
        XCTAssertEqual(permutations1.count, factorial(n: count) / factorial(n: count - count1))
        XCTAssertEqual(permutations1[0], [0, 1])
        XCTAssertEqual(permutations1[1], [0, 2])
        XCTAssertEqual(permutations1[2], [1, 0])
        XCTAssertEqual(permutations1[3], [1, 2])
        XCTAssertEqual(permutations1[4], [2, 0])
        XCTAssertEqual(permutations1[5], [2, 1])
        
        let count2 = count - 2
        let permutations2 = list.permutations(ofCount: count2)
        XCTAssertEqual(permutations2.count, factorial(n: count) / factorial(n: count - count2))
        XCTAssertEqual(permutations2[0], [0])
        XCTAssertEqual(permutations2[1], [1])
        XCTAssertEqual(permutations2[2], [2])
    }
    
    func testPermutationsWithRepetition() {
        let count = list.count
        
        let count0 = count + 1
        let permutationsWithRepetition0 = list.permutationsWithRepetition(ofCount: count0)
        XCTAssertEqual(permutationsWithRepetition0.count, exponentiation(n: count, r: count0))
        XCTAssertEqual(permutationsWithRepetition0[0], [0, 0, 0, 0])
        XCTAssertEqual(permutationsWithRepetition0[1], [0, 0, 0, 1])
        XCTAssertEqual(permutationsWithRepetition0[2], [0, 0, 0, 2])
        XCTAssertEqual(permutationsWithRepetition0[3], [0, 0, 1, 0])
        XCTAssertEqual(permutationsWithRepetition0[4], [0, 0, 1, 1])
        XCTAssertEqual(permutationsWithRepetition0[5], [0, 0, 1, 2])
        XCTAssertEqual(permutationsWithRepetition0[6], [0, 0, 2, 0])
        XCTAssertEqual(permutationsWithRepetition0[7], [0, 0, 2, 1])
        XCTAssertEqual(permutationsWithRepetition0[8], [0, 0, 2, 2])
        XCTAssertEqual(permutationsWithRepetition0[9], [0, 1, 0, 0])
        XCTAssertEqual(permutationsWithRepetition0[10], [0, 1, 0, 1])
        XCTAssertEqual(permutationsWithRepetition0[11], [0, 1, 0, 2])
        XCTAssertEqual(permutationsWithRepetition0[12], [0, 1, 1, 0])
        XCTAssertEqual(permutationsWithRepetition0[13], [0, 1, 1, 1])
        XCTAssertEqual(permutationsWithRepetition0[14], [0, 1, 1, 2])
        XCTAssertEqual(permutationsWithRepetition0[15], [0, 1, 2, 0])
        XCTAssertEqual(permutationsWithRepetition0[16], [0, 1, 2, 1])
        XCTAssertEqual(permutationsWithRepetition0[17], [0, 1, 2, 2])
        XCTAssertEqual(permutationsWithRepetition0[18], [0, 2, 0, 0])
        XCTAssertEqual(permutationsWithRepetition0[19], [0, 2, 0, 1])
        XCTAssertEqual(permutationsWithRepetition0[20], [0, 2, 0, 2])
        XCTAssertEqual(permutationsWithRepetition0[21], [0, 2, 1, 0])
        XCTAssertEqual(permutationsWithRepetition0[22], [0, 2, 1, 1])
        XCTAssertEqual(permutationsWithRepetition0[23], [0, 2, 1, 2])
        XCTAssertEqual(permutationsWithRepetition0[24], [0, 2, 2, 0])
        XCTAssertEqual(permutationsWithRepetition0[25], [0, 2, 2, 1])
        XCTAssertEqual(permutationsWithRepetition0[26], [0, 2, 2, 2])
        XCTAssertEqual(permutationsWithRepetition0[27], [1, 0, 0, 0])
        XCTAssertEqual(permutationsWithRepetition0[28], [1, 0, 0, 1])
        XCTAssertEqual(permutationsWithRepetition0[29], [1, 0, 0, 2])
        XCTAssertEqual(permutationsWithRepetition0[30], [1, 0, 1, 0])
        XCTAssertEqual(permutationsWithRepetition0[31], [1, 0, 1, 1])
        XCTAssertEqual(permutationsWithRepetition0[32], [1, 0, 1, 2])
        XCTAssertEqual(permutationsWithRepetition0[33], [1, 0, 2, 0])
        XCTAssertEqual(permutationsWithRepetition0[34], [1, 0, 2, 1])
        XCTAssertEqual(permutationsWithRepetition0[35], [1, 0, 2, 2])
        XCTAssertEqual(permutationsWithRepetition0[36], [1, 1, 0, 0])
        XCTAssertEqual(permutationsWithRepetition0[37], [1, 1, 0, 1])
        XCTAssertEqual(permutationsWithRepetition0[38], [1, 1, 0, 2])
        XCTAssertEqual(permutationsWithRepetition0[39], [1, 1, 1, 0])
        XCTAssertEqual(permutationsWithRepetition0[40], [1, 1, 1, 1])
        XCTAssertEqual(permutationsWithRepetition0[41], [1, 1, 1, 2])
        XCTAssertEqual(permutationsWithRepetition0[42], [1, 1, 2, 0])
        XCTAssertEqual(permutationsWithRepetition0[43], [1, 1, 2, 1])
        XCTAssertEqual(permutationsWithRepetition0[44], [1, 1, 2, 2])
        XCTAssertEqual(permutationsWithRepetition0[45], [1, 2, 0, 0])
        XCTAssertEqual(permutationsWithRepetition0[46], [1, 2, 0, 1])
        XCTAssertEqual(permutationsWithRepetition0[47], [1, 2, 0, 2])
        XCTAssertEqual(permutationsWithRepetition0[48], [1, 2, 1, 0])
        XCTAssertEqual(permutationsWithRepetition0[49], [1, 2, 1, 1])
        XCTAssertEqual(permutationsWithRepetition0[50], [1, 2, 1, 2])
        XCTAssertEqual(permutationsWithRepetition0[51], [1, 2, 2, 0])
        XCTAssertEqual(permutationsWithRepetition0[52], [1, 2, 2, 1])
        XCTAssertEqual(permutationsWithRepetition0[53], [1, 2, 2, 2])
        XCTAssertEqual(permutationsWithRepetition0[54], [2, 0, 0, 0])
        XCTAssertEqual(permutationsWithRepetition0[55], [2, 0, 0, 1])
        XCTAssertEqual(permutationsWithRepetition0[56], [2, 0, 0, 2])
        XCTAssertEqual(permutationsWithRepetition0[57], [2, 0, 1, 0])
        XCTAssertEqual(permutationsWithRepetition0[58], [2, 0, 1, 1])
        XCTAssertEqual(permutationsWithRepetition0[59], [2, 0, 1, 2])
        XCTAssertEqual(permutationsWithRepetition0[60], [2, 0, 2, 0])
        XCTAssertEqual(permutationsWithRepetition0[61], [2, 0, 2, 1])
        XCTAssertEqual(permutationsWithRepetition0[62], [2, 0, 2, 2])
        XCTAssertEqual(permutationsWithRepetition0[63], [2, 1, 0, 0])
        XCTAssertEqual(permutationsWithRepetition0[64], [2, 1, 0, 1])
        XCTAssertEqual(permutationsWithRepetition0[65], [2, 1, 0, 2])
        XCTAssertEqual(permutationsWithRepetition0[66], [2, 1, 1, 0])
        XCTAssertEqual(permutationsWithRepetition0[67], [2, 1, 1, 1])
        XCTAssertEqual(permutationsWithRepetition0[68], [2, 1, 1, 2])
        XCTAssertEqual(permutationsWithRepetition0[69], [2, 1, 2, 0])
        XCTAssertEqual(permutationsWithRepetition0[70], [2, 1, 2, 1])
        XCTAssertEqual(permutationsWithRepetition0[71], [2, 1, 2, 2])
        XCTAssertEqual(permutationsWithRepetition0[72], [2, 2, 0, 0])
        XCTAssertEqual(permutationsWithRepetition0[73], [2, 2, 0, 1])
        XCTAssertEqual(permutationsWithRepetition0[74], [2, 2, 0, 2])
        XCTAssertEqual(permutationsWithRepetition0[75], [2, 2, 1, 0])
        XCTAssertEqual(permutationsWithRepetition0[76], [2, 2, 1, 1])
        XCTAssertEqual(permutationsWithRepetition0[77], [2, 2, 1, 2])
        XCTAssertEqual(permutationsWithRepetition0[78], [2, 2, 2, 0])
        XCTAssertEqual(permutationsWithRepetition0[79], [2, 2, 2, 1])
        XCTAssertEqual(permutationsWithRepetition0[80], [2, 2, 2, 2])
        
        let count1 = count
        let permutationsWithRepetition1 = list.permutationsWithRepetition() // or permutationsWithRepetition(ofCount: count1)
        XCTAssertEqual(permutationsWithRepetition1.count, exponentiation(n: count, r: count1))
        XCTAssertEqual(permutationsWithRepetition1[0], [0, 0, 0])
        XCTAssertEqual(permutationsWithRepetition1[1], [0, 0, 1])
        XCTAssertEqual(permutationsWithRepetition1[2], [0, 0, 2])
        XCTAssertEqual(permutationsWithRepetition1[3], [0, 1, 0])
        XCTAssertEqual(permutationsWithRepetition1[4], [0, 1, 1])
        XCTAssertEqual(permutationsWithRepetition1[5], [0, 1, 2])
        XCTAssertEqual(permutationsWithRepetition1[6], [0, 2, 0])
        XCTAssertEqual(permutationsWithRepetition1[7], [0, 2, 1])
        XCTAssertEqual(permutationsWithRepetition1[8], [0, 2, 2])
        XCTAssertEqual(permutationsWithRepetition1[9], [1, 0, 0])
        XCTAssertEqual(permutationsWithRepetition1[10], [1, 0, 1])
        XCTAssertEqual(permutationsWithRepetition1[11], [1, 0, 2])
        XCTAssertEqual(permutationsWithRepetition1[12], [1, 1, 0])
        XCTAssertEqual(permutationsWithRepetition1[13], [1, 1, 1])
        XCTAssertEqual(permutationsWithRepetition1[14], [1, 1, 2])
        XCTAssertEqual(permutationsWithRepetition1[15], [1, 2, 0])
        XCTAssertEqual(permutationsWithRepetition1[16], [1, 2, 1])
        XCTAssertEqual(permutationsWithRepetition1[17], [1, 2, 2])
        XCTAssertEqual(permutationsWithRepetition1[18], [2, 0, 0])
        XCTAssertEqual(permutationsWithRepetition1[19], [2, 0, 1])
        XCTAssertEqual(permutationsWithRepetition1[20], [2, 0, 2])
        XCTAssertEqual(permutationsWithRepetition1[21], [2, 1, 0])
        XCTAssertEqual(permutationsWithRepetition1[22], [2, 1, 1])
        XCTAssertEqual(permutationsWithRepetition1[23], [2, 1, 2])
        XCTAssertEqual(permutationsWithRepetition1[24], [2, 2, 0])
        XCTAssertEqual(permutationsWithRepetition1[25], [2, 2, 1])
        XCTAssertEqual(permutationsWithRepetition1[26], [2, 2, 2])
        
        let count2 = count - 1
        let permutationsWithRepetition2 = list.permutationsWithRepetition(ofCount: count2)
        XCTAssertEqual(permutationsWithRepetition2.count, exponentiation(n: count, r: count2))
        XCTAssertEqual(permutationsWithRepetition2[0], [0, 0])
        XCTAssertEqual(permutationsWithRepetition2[1], [0, 1])
        XCTAssertEqual(permutationsWithRepetition2[2], [0, 2])
        XCTAssertEqual(permutationsWithRepetition2[3], [1, 0])
        XCTAssertEqual(permutationsWithRepetition2[4], [1, 1])
        XCTAssertEqual(permutationsWithRepetition2[5], [1, 2])
        XCTAssertEqual(permutationsWithRepetition2[6], [2, 0])
        XCTAssertEqual(permutationsWithRepetition2[7], [2, 1])
        XCTAssertEqual(permutationsWithRepetition2[8], [2, 2])
        
        let count3 = count - 2
        let permutationsWithRepetition3 = list.permutationsWithRepetition(ofCount: count3)
        XCTAssertEqual(permutationsWithRepetition3.count, exponentiation(n: count, r: count3))
        XCTAssertEqual(permutationsWithRepetition3[0], [0])
        XCTAssertEqual(permutationsWithRepetition3[1], [1])
        XCTAssertEqual(permutationsWithRepetition3[2], [2])
    }
}
