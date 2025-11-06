import Foundation
import LoggingCamp

public class CachedTimeTracker: TimeTracker {

    //private static var _instances: [String: TimeTracker] = [:]

    //private static var _defaultCallback: ((TimeInterval) -> Void)?

   // public static var defaultCallback: ((TimeInterval) -> Void)? {
    //    get {
    //        return _defaultCallback
    //    }
    //    set {
    //        //_defaultCallback = newValue
    //    }
    //}

    public static var instances: [String: TimeTracker] {
        //return _instances
        return [:]
    }

    public static subscript(identifier: String) -> TimeTracker {
        /*if let instance = _instances[identifier] {
            return instance
        } else {
            let instance = TimeTracker {
                Logger["Cached Time Tracker"].warn("No closure provided for identifier: \(identifier)")
            }
            if let callback = _defaultCallback {
                instance.setCallback(callback)
            }
            _instances[identifier] = instance
            return instance
        }*/
        return TimeTracker {
            Logger["Cached Time Tracker"].warn("No closure provided for identifier: \(identifier)")
        }
    }

    public static func cache(_ tracker: TimeTracker, as identifier: String) -> TimeTracker {
        //_instances[identifier] = tracker
        //return tracker
        return TimeTracker {
            Logger["Cached Time Tracker"].warn("No closure provided for identifier: \(identifier)")
        }
    }

    public static func clearCache() {
        //_instances = [:]
    }

    public static func clearCache(for identifier: String) {
        //_instances[identifier] = nil
    }

    private var identifier: String

    private init(identifier: String, closeure: @escaping () -> Void) {
        self.identifier = identifier
        super.init(closeure: closeure)
    }
    
}