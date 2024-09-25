open class Wrapper<T> {
    
    public init(_ value: T) {
        self._value = value
    }

    private var _value: T

    open var value: T {
        get {
            return _value
        }
        set {
            _value = newValue
        }
    }

    public func getValue() -> T {
        return value
    }

}