open class ArrayWrapper<T> {
    
    public init(_ value: [T]) {
        self._value = value
    }

    private var _value: [T]

    open var value: [T] {
        get {
            return _value
        }
        set {
            _value = newValue
        }
    }

    public func getValue() -> [T] {
        return _value
    }

    public func add(_ element: T) {
        _value.append(element)
    }

    public func append<S>(contentsOf newElements: S) where S : Sequence, T == S.Element {
        _value.append(contentsOf: newElements)
    }

    public func insert(_ newElement: T, at i: Int) {
        _value.insert(newElement, at: i)
    }

    public func insert<S>(contentsOf newElements: S, at i: Int) where S : Collection, T == S.Element {
        _value.insert(contentsOf: newElements, at: i)
    }

    public func remove(at i: Int) -> T {
        return value.remove(at: i)
    }

    public func removeSubrange(_ bounds: Range<Int>) {
        _value.removeSubrange(bounds)
    }

    public func removeAll(keepingCapacity keepCapacity: Bool = false) {
        _value.removeAll(keepingCapacity: keepCapacity)
    }

    @discardableResult
    public func removeFirst() -> T {
        return _value.removeFirst()
    }

    public func removeFirst(_ k: Int) {
        _value.removeFirst(k)
    }

    @discardableResult
    public func removeLast() -> T {
        return _value.removeLast()
    }

    public func removeLast(_ k: Int) {
        _value.removeLast(k)
    }

    public func forEach(_ body: (T) throws -> Void) rethrows {
        try _value.forEach(body)
    }

}