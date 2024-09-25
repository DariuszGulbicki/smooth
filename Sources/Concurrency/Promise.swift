import Foundation

postfix operator ~
infix operator ~~

public class Promise<T> {
        
    private let promiseQueue = DispatchQueue(label: "PromiseQueue", attributes: .concurrent)

    private var resolver: (() -> T)

    public init(resolver: @escaping () -> T) {
        self.resolver = resolver
    }

    @discardableResult
    public func then(_ onFulfilled: @escaping (T) -> Void) -> Promise<T> {
        let promise = Promise<T>(resolver: resolver)
        promiseQueue.async {
            let value = self.resolver()
            onFulfilled(value)
        }
        return promise
    }

    public func `await`() -> T {
        let semaphore = DispatchSemaphore(value: 0)
        var value: T!
        promiseQueue.async {
            value = self.resolver()
            semaphore.signal()
        }
        semaphore.wait()
        return value
    }

}

public postfix func ~<T>(promise: Promise<T>) -> T {
    return promise.await()
}

@discardableResult
public func ~~<T>(promise: Promise<T>, onFulfilled: @escaping (T) -> Void) -> Promise<T> {
    return promise.then(onFulfilled)
}