public enum BinaryHeapOrderType: CustomStringConvertible {
    case max
    case min
    
    public var description: String {
        switch self {
        case .max:
            return "max"
        case .min:
            return "min"
        }
    }
}

public struct BinaryHeap<Element: Comparable> {
    
    private var nodes: [Element]
    
    public let orderType: BinaryHeapOrderType
    
    public var isEmpty: Bool {
        return nodes.isEmpty
    }
    
    public var count: Int {
        return nodes.count
    }
    
    public var peek: Element? {
        return nodes.first
    }
    
    public init(orderType: BinaryHeapOrderType) {
        self.nodes = []
        self.orderType = orderType
    }
    
    private func operation(lhs: Element, rhs: Element) -> Bool {
        return orderType == .max ? (lhs > rhs) : (lhs < rhs)
    }
    
    private mutating func heapify(from array: [Element]) {
        nodes = array
        
        for i in (0 ..< array.count / 2).reversed() {
            heapifyDown(from: i)
        }
    }
    
    private mutating func heapifyUp(from index: Int, to endIndex: Int) {
        var endIndex = endIndex
        let newItem = nodes[endIndex]
        
        while endIndex > index {
            let parentIndex = (endIndex - 1) >> 1
            let parent = nodes[parentIndex]
            if operation(lhs: newItem, rhs: parent) {
                nodes[endIndex] = parent
                endIndex = parentIndex
                
            } else {
                break
            }
        }
        
        nodes[endIndex] = newItem
    }
    
    private mutating func heapifyDown(from index: Int) {
        var index = index
        let endIndex = count
        let startIndex = index
        let newItem = nodes[startIndex]
        
        var childIndex = 2 * index + 1
        while childIndex < endIndex {
            let rightIndex = childIndex + 1
            if rightIndex < endIndex && !operation(lhs: nodes[childIndex], rhs: nodes[rightIndex]) {
                childIndex = rightIndex
            }
            nodes[index] = nodes[childIndex]
            index = childIndex
            childIndex = 2 * index + 1
        }
        
        nodes[index] = newItem
        heapifyUp(from: startIndex, to: index)
    }
    
    public mutating func insert(_ element: Element) {
        nodes.append(element)
        heapifyUp(from: 0, to: count - 1)
    }
    
    @discardableResult
    public mutating func extract() -> Element {
        let lastItem = nodes.removeLast()
        if !isEmpty {
            let result = nodes[0]
            nodes[0] = lastItem
            heapifyDown(from: 0)
            return result
        }
        return lastItem
    }
    
    @discardableResult
    public mutating func insertThenExtract(_ element: Element) -> Element {
        var result = element
        if !isEmpty && operation(lhs: nodes[0], rhs: result) {
            swap(&result, &nodes[0])
            heapifyDown(from: 0)
        }
        return result
    }
    
    @discardableResult
    public mutating func extractThenInsert(_ element: Element) -> Element {
        let result = nodes[0]
        nodes[0] = element
        heapifyDown(from: 0)
        return result
    }
    
    public func firstIndex(of element: Element) -> Int? {
        return nodes.firstIndex(of: element)
    }
    
    @discardableResult
    public mutating func remove(at index: Int) -> Element {
        let result = nodes[index]
        nodes[index] = nodes.removeLast()
        if index < count {
            heapifyDown(from: index)
            heapifyUp(from: 0, to: index)
        }
        return result
    }
    
    public mutating func update(at index: Int, element: Element) {
        let node = nodes[index]
        nodes[index] = element
        
        switch orderType {
        case .max:
            if node > element {
                heapifyDown(from: index)
                
            } else {
                heapifyUp(from: 0, to: index)
            }
            
        case .min:
            if node > element {
                heapifyUp(from: 0, to: index)
                
            } else {
                heapifyDown(from: index)
            }
        }
    }
}

extension BinaryHeap {
    
    public init(orderType: BinaryHeapOrderType, array: Array<Element>) {
        self.init(orderType: orderType)
        
        heapify(from: array)
    }
    
    public init(orderType: BinaryHeapOrderType, arrayLiteral elements: Element...) {
        self.init(orderType: orderType)
        
        heapify(from: elements)
    }
}
