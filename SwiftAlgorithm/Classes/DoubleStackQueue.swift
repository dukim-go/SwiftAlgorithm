public final class DoubleStackQueue<Element> {
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
    
    public init() { }
    
    public func enqueue(_ n: Element) {
        inbox.append(n)
    }
    
    public func dequeue() -> Element {
        if outbox.isEmpty {
            outbox = inbox.reversed()
            inbox.removeAll()
        }
        return outbox.removeLast()
    }
}

extension DoubleStackQueue {
    
    public convenience init(_ array: Array<Element>){
        self.init()
        
        self.inbox = array
    }
}

extension DoubleStackQueue: ExpressibleByArrayLiteral {
    
    public convenience init(arrayLiteral elements: Element...) {
        self.init()
        
        self.inbox = elements
    }
}
