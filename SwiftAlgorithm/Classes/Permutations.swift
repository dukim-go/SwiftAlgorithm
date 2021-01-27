extension Array where Element: Equatable {
    
    private mutating func remove(object: Element) {
        guard count > 0 else { return }
        guard let index = firstIndex(of: object) else { return }

        remove(at: index)
    }
    
    /// Permutations
    public func permutations(ofCount k: Int? = nil) -> [[Element]] {
        let k = k ?? count
        
        guard k > 0 else {
            return []
        }
        
        if k == 1 {
            return map({ [$0] })
            
        } else {
            var result = [[Element]]()

            for i in self {
                var sub = self
                sub.remove(object: i)
                result += sub.permutations(ofCount: k - 1).map({ [i] + $0 })
            }

            return result
        }
    }
    
    /// Permutations with repetition
    public func permutationsWithRepetition(ofCount k: Int? = nil) -> [[Element]] {
        let k = k ?? count
        
        guard k > 0 else {
            return []
        }
        
        if k == 1 {
            return map({ [$0] })
            
        } else {
            var result = [[Element]]()
            
            for i in self {
                result += permutationsWithRepetition(ofCount: k - 1).map({ [i] + $0 })
            }
            
            return result
        }
    }
}
