open class Cached<T> {

    private var _fetcher: () -> T

    public var fetcher: () -> T {

        get {
            return _fetcher
        }

        set {
            _cache = nil
            _fetcher = newValue
        }

    }

    private var _cache: T? = nil

    public var cache: T? {
        get {
            if _cache == nil {
                _cache = _fetcher()
            }
            return _cache
        }
    }

    public init(fetcher: @escaping () -> T) {
        self._fetcher = fetcher
    }

    public func clear() {
        _cache = nil
    }

    public func refetch() {
        _cache = _fetcher()
    }
    
}

// Operators

prefix operator |-|
postfix operator /?

public prefix func |-|<T>(fetcher: @escaping () -> T) -> Cached<T> {
    return Cached(fetcher: fetcher)
}

public postfix func /?<T>(cached: Cached<T>) -> T? {
    return cached.cache
}

public func ==<T: Equatable>(lhs: Cached<T>, rhs: Cached<T>) -> Bool {
    return lhs.cache == rhs.cache
}

public func !=<T: Equatable>(lhs: Cached<T>, rhs: Cached<T>) -> Bool {
    return lhs.cache != rhs.cache
}

public func ==<T: Equatable>(lhs: Cached<T>, rhs: T) -> Bool {
    return lhs.cache == rhs
}

public func !=<T: Equatable>(lhs: Cached<T>, rhs: T) -> Bool {
    return lhs.cache != rhs
}

public func ==<T: Equatable>(lhs: T, rhs: Cached<T>) -> Bool {
    return lhs == rhs.cache
}

public func !=<T: Equatable>(lhs: T, rhs: Cached<T>) -> Bool {
    return lhs != rhs.cache
}

// Extension

extension Cached where T: Equatable {

    public func equals(_ element: T) -> Bool {
        return cache == element
    }

}