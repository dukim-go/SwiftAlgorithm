extension Array where Element: Equatable {
    
    public func combinations(ofCount k: Int? = nil) -> [[Element]] {
        let k = k ?? count
        
        guard k > 0 else {
            return []
        }

        if k == 1 {
            return map({ [$0] })

        } else {
            if let first = first {
                let sub = Array(self[1 ..< count])
                return sub.combinations(ofCount: k - 1).map({ [first] + $0 }) + sub.combinations(ofCount: k)

            } else {
                return []
            }
        }
    }
    
    public func combinationsWithRepetition(ofCount k: Int? = nil) -> [[Element]] {
        let k = k ?? count
        
        guard k > 0 else {
            return []
        }

        if k == 1 {
            return map({ [$0] })

        } else {
            if let first = first {
                let sub = Array(self[1 ..< count])
                return combinationsWithRepetition(ofCount: k - 1).map({ [first] + $0 }) + sub.combinationsWithRepetition(ofCount: k)

            } else {
                return []
            }
        }
    }
}
