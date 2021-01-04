public final class Queue<Element> {
    private let list = LinkedList<Element>()
    
    public var front: Element? {
        if isEmpty {
            return nil
        } else {
            return list.head?.element
        }
    }
    
    public var count: Int {
        return list.count
    }
    
    public var isEmpty: Bool {
        return count <= 0
    }
    
    public init() {}
    
    public func enqueue(_ element: Element) {
        list.append(element)
    }
    
    public func dequeue() -> Element {
        return list.removeFirst()
    }
}
