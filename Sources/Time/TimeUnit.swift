import Foundation

public enum TimeUnit {
    
    case seconds
    case minutes
    case hours
    case days
    case weeks
    case months
    case years
    case milliseconds
    case microseconds
    case nanoseconds
    
    public var conversionFactor: TimeInterval {
        switch self {
        case .seconds:
            return 1
        case .minutes:
            return 60
        case .hours:
            return 3600
        case .days:
            return 86400
        case .weeks:
            return 604800
        case .months:
            return 2628000
        case .years:
            return 31536000
        case .milliseconds:
            return 0.001
        case .microseconds:
            return 0.000001
        case .nanoseconds:
            return 0.000000001
        }
    }

    // Works like this: TimeUnit.seconds.convert(TimeInterval, to: TimeUnit)
    // Example: TimeUnit.seconds.convert(60, to: .minutes) -> 1
    public func convert(_ timeInterval: TimeInterval, to unit: TimeUnit) -> TimeInterval {
        return timeInterval / conversionFactor / unit.conversionFactor
    }

    //Works like this: TimeInterval.converted(TimeUnit)
    //Example: 60.converted(.minutes) -> 1
    public func converted(_ timeInterval: TimeInterval) -> TimeInterval {
        return timeInterval / conversionFactor
    }
    
    public var humanReadable: String {
        switch self {
        case .seconds:
            return "second"
        case .minutes:
            return "minute"
        case .hours:
            return "hour"
        case .days:
            return "day"
        case .weeks:
            return "week"
        case .months:
            return "month"
        case .years:
            return "year"
        case .milliseconds:
            return "millisecond"
        case .microseconds:
            return "microsecond"
        case .nanoseconds:
            return "nanosecond"
        }
    }
    
}