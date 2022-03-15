public struct DoubleStackQueue<Element>: IteratorProtocol, Sequence {
    
    private var inbox: [Element] = []
    private var outbox: [Element] = []
    
    public var list: [Element] {
        return outbox.reversed() + inbox
    }
    
    public var front: Element? {
        return outbox.last ?? inbox.first
    }
    
    public var back: Element? {
        return inbox.last ?? outbox.first
    }
    
    public var count: Int{
        return inbox.count + outbox.count
    }
    
    public var isEmpty: Bool{
        return inbox.isEmpty && outbox.isEmpty
    }
    
    public init() {}
    
    public mutating func enqueue(_ n: Element) {
        inbox.append(n)
    }
    
    @discardableResult public mutating func dequeue() -> Element {
        if outbox.isEmpty {
            outbox = inbox.reversed()
            inbox.removeAll()
        }
        return outbox.removeLast()
    }
    
    // MARK: - IteratorProtocol, Sequence -
    
    private var iteratorIndex: Int?

    public mutating func next() -> Element? {
        let nextIndex: Int
        if let iteratorIndex = iteratorIndex {
            nextIndex = iteratorIndex + 1
            
        } else {
            nextIndex = 0
        }
        
        if nextIndex < count {
            iteratorIndex = nextIndex
            if nextIndex < outbox.count {
                return outbox[outbox.count - 1 - nextIndex]

            } else {
                return inbox[nextIndex - outbox.count]
            }

        } else {
            iteratorIndex = nil
            return nil
        }
    }
}

extension DoubleStackQueue {
    
    public init(_ array: Array<Element>){
        self.init()
        
        self.inbox = array
    }
}

extension DoubleStackQueue: ExpressibleByArrayLiteral {
    
    public init(arrayLiteral elements: Element...) {
        self.init()
        
        self.inbox = elements
    }
}
