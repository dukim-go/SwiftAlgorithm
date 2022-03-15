public final class LinkedListQueue<Element> {
    
    public let list: LinkedList<Element>
    
    public var front: Element? {
        if isEmpty {
            return nil
            
        } else {
            return list.head?.element
        }
    }
    
    public var back: Element? {
        if isEmpty {
            return nil
            
        } else {
            return list.tail?.element
        }
    }
    
    public var count: Int {
        return list.count
    }
    
    public var isEmpty: Bool {
        return count <= 0
    }
    
    public init(list: LinkedList<Element> = []) {
        self.list = list
    }
    
    public func enqueue(_ element: Element) {
        list.append(element)
    }
    
    @discardableResult public func dequeue() -> Element {
        return list.removeFirst()
    }
}

extension LinkedListQueue {
    
    public convenience init(_ array: Array<Element>){
        self.init(list: LinkedList<Element>(array: array))
    }
}

extension LinkedListQueue: ExpressibleByArrayLiteral {
    
    public convenience init(arrayLiteral elements: Element...) {
        self.init(list: LinkedList<Element>(array: elements))
    }
}
