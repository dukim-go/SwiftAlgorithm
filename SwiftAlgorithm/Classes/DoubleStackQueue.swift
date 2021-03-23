public struct DoubleStackQueue<Element> {
    private var inbox: [Element] = []
    private var outbox: [Element] = []
    
    public var isEmpty: Bool{
        return inbox.isEmpty && outbox.isEmpty
    }
    
    public var count: Int{
        return inbox.count + outbox.count
    }
    
    public var front: Element? {
        return outbox.last ?? inbox.first
    }
    
    public var back: Element? {
        return inbox.last ?? outbox.first
    }
    
    public init() { }
    
    public mutating func enqueue(_ n: Element) {
        inbox.append(n)
    }
    
    public mutating func dequeue() -> Element {
        if outbox.isEmpty {
            outbox = inbox.reversed()
            inbox.removeAll()
        }
        return outbox.removeLast()
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
