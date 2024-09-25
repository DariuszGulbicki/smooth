open class DictionaryWrapper<Key: Hashable, Value> {
    
    public init(_ value: [Key: Value]) {
        self._value = value
    }

    private var _value: [Key: Value]

    open var value: [Key: Value] {
        get {
            return _value
        }
        set {
            _value = newValue
        }
    }

    public subscript(key: Key) -> Value? {
        get {
            return _value[key]
        }
        set {
            _value[key] = newValue
        }
    }

    public func getDictionary() -> [Key: Value] {
        return _value
    }

    public func updateValue(_ value: Value, forKey key: Key) -> Value? {
        return _value.updateValue(value, forKey: key)
    }

    public func merge<S>(_ other: S, uniquingKeysWith combine: (Value, Value) throws -> Value) rethrows where S : Sequence, S.Element == (Key, Value) {
        try _value.merge(other, uniquingKeysWith: combine)
    }

    public func merge(_ other: [Key: Value], uniquingKeysWith combine: (Value, Value) throws -> Value) rethrows {
        try _value.merge(other, uniquingKeysWith: combine)
    }

}