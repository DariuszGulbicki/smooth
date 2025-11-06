import Foundation

/*@dynamicMemberLookup
public class Printer {

    typealias PrintHandler = (String) -> Void

    // MARK: - Global Printer mechanism

    public static var console: Printer? = Printer(named: "console")
    public static var defaultHandler: PrintHandler = { message in
        Swift.print(message)
    }
    public static var printers: [String: Printer] = [:]

    public subscript(dynamicMember name: String) -> Printer {
        if let printer = Printer.printers[name] {
            return printer
        } else {
            let printer = Printer()
            Printer.printers[name] = printer
            return printer
        }
    }

    private let printHandler: PrintHandler
    private let name: String

    public init(printHandler: @escaping PrintHandler = defaultHandler, named: String = UUID().uuidString) {
        self.printHandler = printHandler
        self.name = named
    }

    private lazy var dispatchQueue = DispatchQueue(label: "io.printer.\(name)")

    public func print(_ message: String) {
        dispatchQueue.async(flags: .barrier) {
            self.printHandler(message)
        }
    }
}

/// Mark: - Global print functions override

public func print(_ message: String) {
    Printer.console?.print(message) ?? Swift.print(message)
}

public func print(_ items: Any...) {
    Printer.console?.print(items.map { "\($0)" }.joined(separator: " ")) ?? Swift.print(items.map { "\($0)" }.joined(separator: " "))
}*/