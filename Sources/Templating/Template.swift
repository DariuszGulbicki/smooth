import Foundation

public class Template: CustomStringConvertible, ExpressibleByStringLiteral {

    private let template: String
    private let placeholderPrefix: String
    private let placeholderSuffix: String

    public init(template: String, placeholderPrefix: String = "{{", placeholderSuffix: String = "}}") {
        self.template = template
        self.placeholderPrefix = placeholderPrefix
        self.placeholderSuffix = placeholderSuffix
    }

    public required init(stringLiteral value: String) {
        self.template = value
        self.placeholderPrefix = "{{"
        self.placeholderSuffix = "}}"
    }

    public func replace(_ context: [String: Any]) -> String {
        var result = template
        for (key, value) in context {
            result = result.replacingOccurrences(of: "\(placeholderPrefix)\(key)\(placeholderSuffix)", with: "\(value)")
            result = result.replacingOccurrences(of: "\(placeholderPrefix) \(key) \(placeholderSuffix)", with: "\(value)")
        }
        return result
    }

    public var description: String {
        return template
    }

}