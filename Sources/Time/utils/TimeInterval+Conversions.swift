import Foundation

public extension TimeInterval {
    
    var inSeconds: TimeInterval {
        return TimeUnit.seconds.converted(self)
    }

    var inMinutes: TimeInterval {
        return TimeUnit.minutes.converted(self)
    }

    var inHours: TimeInterval {
        return TimeUnit.hours.converted(self)
    }

    var inDays: TimeInterval {
        return TimeUnit.days.converted(self)
    }

    var inWeeks: TimeInterval {
        return TimeUnit.weeks.converted(self)
    }

    var inMonths: TimeInterval {
        return TimeUnit.months.converted(self)
    }

    var inYears: TimeInterval {
        return TimeUnit.years.converted(self)
    }

    var inMilliseconds: TimeInterval {
        return TimeUnit.milliseconds.converted(self)
    }

    var inMicroseconds: TimeInterval {
        return TimeUnit.microseconds.converted(self)
    }

    var inNanoseconds: TimeInterval {
        return TimeUnit.nanoseconds.converted(self)
    }

    var formattedString: String {
        let years = Int(self.inYears)
        let months = Int(self.inMonths) % 12
        let weeks = Int(self.inWeeks) % 4
        let days = Int(self.inDays) % 7
        let hours = Int(self.inHours) % 24
        let minutes = Int(self.inMinutes) % 60
        let seconds = Int(self.inSeconds) % 60
        let milliseconds = Int(self.inMilliseconds) % 1000
        let microseconds = Int(self.inMicroseconds) % 1000
        let nanoseconds = Int(self.inNanoseconds) % 1000
        var components: [String] = []
        if years > 0 {
            components.append("\(years)y")
        }
        if months > 0 {
            components.append("\(months)m")
        }
        if weeks > 0 {
            components.append("\(weeks)w")
        }
        if days > 0 {
            components.append("\(days)d")
        }
        if hours > 0 {
            components.append("\(hours)h")
        }
        if minutes > 0 {
            components.append("\(minutes)min")
        }
        if seconds > 0 {
            components.append("\(seconds)s")
        }
        if milliseconds > 0 {
            components.append("\(milliseconds)ms")
        }
        if microseconds > 0 {
            components.append("\(microseconds)μs")
        }
        if nanoseconds > 0 {
            components.append("\(nanoseconds)ns")
        }
        return components.joined(separator: " ")
    }
    
}