import Foundation
import LoggingCamp

@dynamicCallable
public class TimeTracker {

    var _measurmentHistory: [Date: TimeInterval] = [:]

    var closeure: (() -> Void)

    var callback: ((TimeInterval) -> Void)? = { executionTime in 
        Logger["Time Tracker"].info("Execution time: \(executionTime)")
    }

    public var measurmentHistory: [Date: TimeInterval] {
        return _measurmentHistory
    }

    public var lastMeasurment: (Date, TimeInterval)? {
        return _measurmentHistory.max { $0.key < $1.key }
    }

    public var longestMeasurment: (Date, TimeInterval)? {
        return _measurmentHistory.max { $0.value < $1.value }
    }

    public var shortestMeasurment: (Date, TimeInterval)? {
        return _measurmentHistory.min { $0.value < $1.value }
    }

    static func measureExecutionTime(of closure: () -> Void) -> TimeInterval {
        let start = Date()
        closure()
        return Date().timeIntervalSince(start)
    }

    public init(closeure: @escaping () -> Void) {
        self.closeure = closeure
    }

    public func setCallback(_ callback: @escaping (TimeInterval) -> Void) {
        self.callback = callback
    }

    public func setClosure(_ closure: @escaping () -> Void) {
        self.closeure = closure
    }

    public func withClosure(_ closure: @escaping () -> Void) -> TimeTracker {
        self.closeure = closure
        return self
    }

    @discardableResult
    public func measure() -> TimeInterval {
        let executionTime = TimeTracker.measureExecutionTime(of: closeure)
        _measurmentHistory[Date()] = executionTime
        callback?(executionTime)
        return executionTime
    }

    public func dynamicallyCall(withArguments args: [Any]) {
        measure()
    }

    public func cache(as identifier: String) -> TimeTracker {
        return CachedTimeTracker.cache(self, as: identifier)
    }

}