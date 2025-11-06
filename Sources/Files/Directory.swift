import Foundation

public class Directory {

    public let path: String

    public var contents: [String] {
        do {
            return try FileManager.default.contentsOfDirectory(atPath: path)
        } catch {
            print("Error reading contents of directory: \(error)")
            return []
        }
    }

    public init(path: String) {
        self.path = path
    }

    public func create() throws -> Bool {
        FileManager.default.createDirectory(atPath: path, withIntermediateDirectories: true, attributes: nil)
        return true
    }

    public func delete() throws -> Bool {
        try FileManager.default.removeItem(atPath: path)
        return true
    }
}