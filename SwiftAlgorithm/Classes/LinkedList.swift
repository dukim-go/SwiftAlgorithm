public final class LinkedList<Element> {
    
    public final class Node: CustomStringConvertible {
        public var element: Element
        public var next: Node?
        public weak var prev: Node?
        
        public init(element: Element) {
            self.element = element
        }
        
        public var description: String {
            return "\(element)"
        }
    }
    
    public private(set) var head: Node?
    public private(set) var tail: Node?
    public private(set) var count: Int = 0
    public var isEmpty: Bool {
        return count <= 0
    }
    
    public init() {}
    
    public subscript(index: Int) -> Element {
        return node(at: index).element
    }
    
    public func node(at index: Int) -> Node {
        assert(head != nil, "List is empty")
        assert(index >= 0, "index must be greater or equal to 0")
        
        if index == 0 {
            return head!
            
        } else {
            var node = head!.next
            for _ in 1 ..< index {
                node = node?.next
                if node == nil {
                    break
                }
            }
            
            assert(node != nil, "index is out of bounds.")
            return node!
        }
    }
    
    public func append(_ element: Element) {
        append(Node(element: element))
    }
    
    public func append(_ node: Node) {
        if head != nil, tail != nil {
            node.prev = tail
            tail?.next = node
            tail = node

        } else {
            head = node
            tail = node
        }
        count += 1
    }
    
    public func append(_ list: LinkedList) {
        list.forEach { append($0) }
    }
    
    public func insert(_ element: Element, at index: Int) {
        insert(Node(element: element), at: index)
    }
    
    public func insert(_ newNode: Node, at index: Int) {
        if count == 0 {
            head = newNode
            tail = newNode
            
        } else if index == 0 {
            newNode.next = head
            head?.prev = newNode
            head = newNode
            
        } else if index == count {
            newNode.prev = tail
            tail?.next = newNode
            tail = newNode
            
        } else {
            let prev = node(at: index - 1)
            let next = prev.next
            newNode.prev = prev
            newNode.next = next
            prev.next = newNode
            next?.prev = newNode
        }
        count += 1
    }
    
    public func insert(_ list: LinkedList, at index: Int) {
        guard list.count != 0 else {
            return
        }
        
        let count = list.count
        var node = list.head
        for i in index ..< index + count {
            if let _node = node {
                let next = _node.next
                insert(_node, at: i)
                node = next
            }
        }
    }
    
    public func removeAll() {
        head = nil
        tail = nil
        count = 0
    }
    
    @discardableResult public func remove(_ node: Node) -> Element {
        let prev = node.prev
        let next = node.next
        
        if let prev = prev, let next = next {
            prev.next = next
            next.prev = prev
            
        } else if let prev = prev {
            tail = prev
            
        } else if let next = next {
            head = next
            
        } else {
            head = nil
            tail = nil
        }
        
        node.prev = nil
        node.next = nil
        count -= 1
        
        return node.element
    }
    
    @discardableResult public func remove(at index: Int) -> Element {
        return remove(node(at: index))
    }
    
    @discardableResult public func removeFirst() -> Element {
        assert(!isEmpty)
        return remove(head!)
    }
    
    @discardableResult public func removeLast() -> Element {
        assert(!isEmpty)
        return remove(tail!)
    }
}

extension LinkedList: CustomStringConvertible {
    
    public var description: String {
        var des = ""
        var node = head
        while let nd = node {
            des += "\(nd.element)"
            node = nd.next
            if node != nil {
                des += ", "
            }
        }
        return "[" + des + "]"
    }
}

extension LinkedList {
    
    public convenience init(array: Array<Element>) {
        self.init()
        
        array.forEach { append($0) }
    }
}

extension LinkedList: ExpressibleByArrayLiteral {
    
    public convenience init(arrayLiteral elements: Element...) {
        self.init()
        
        elements.forEach { append($0) }
    }
}

extension LinkedList: Collection {
    
    public struct Index: Comparable {
        
        public var node: Node?
        
        public static func == (lhs: Self, rhs: Self) -> Bool {
            switch (lhs.node, rhs.node) {
            case let (left?, right?):
                return left.next === right.next
                
            case (nil, nil):
                return true
                
            default:
                return false
            }
        }
        
        public static func < (lhs: Self, rhs: Self) -> Bool {
            guard lhs != rhs else {
                return false
            }
            let nodes = sequence(first: lhs.node) { $0?.next }
            return nodes.contains { $0 === rhs.node }
        }
    }
    
    public var startIndex: Index {
        return Index(node: head)
    }
    
    public var endIndex: Index {
        return Index(node: tail?.next)
    }
    
    public func index(after i: Index) -> Index {
        return Index(node: i.node?.next)
    }
    
    public subscript(position: Index) -> Element {
        return position.node!.element
    }
}
