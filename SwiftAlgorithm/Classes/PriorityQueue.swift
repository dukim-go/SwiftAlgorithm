public enum PriorityQueueOrderType {
    case max
    case min
}

public struct PriorityQueue<Element: Comparable> {
    
    public let orderType: PriorityQueueOrderType
    
    private var heap: BinaryHeap<Element>
    
    public var isEmpty: Bool {
        return heap.isEmpty
    }
    
    public var count: Int {
        return heap.count
    }
    
    public var peek: Element? {
        return heap.peek
    }
    
    public init(orderType: PriorityQueueOrderType) {
        self.orderType = orderType
        self.heap = BinaryHeap<Element>(orderType: orderType == .max ? .max : .min)
    }
    
    public mutating func enqueue(_ element: Element) {
        heap.insert(element)
    }
    
    public mutating func dequeue() -> Element {
        return heap.extract()
    }
}

extension PriorityQueue {
    
    public init(orderType: PriorityQueueOrderType, array: Array<Element>) {
        self.init(orderType: orderType)
        for element in array {
            enqueue(element)
        }
    }
    
    public init(orderType: PriorityQueueOrderType, arrayLiteral elements: Element...) {
        self.init(orderType: orderType)
        for element in elements {
            enqueue(element)
        }
    }
}
