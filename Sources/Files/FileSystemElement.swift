import Foundation

public class FileSystemElement {
    
    public let path: String

    public var name: String {
        return path.lastPathComponent
    }

    public init(path: String) {
        self.path = path
    }

    public func exists() -> Bool {
        return FileManager.default.fileExists(atPath: path)
    }

    public func isFile() -> Bool {
        var isDir: ObjCBool = false
        return FileManager.default.fileExists(atPath: path, isDirectory: &isDir) && !isDir.boolValue
    }

    public func isDirectory() -> Bool {
        var isDir: ObjCBool = false
        return FileManager.default.fileExists(atPath: path, isDirectory: &isDir) && isDir.boolValue
    }

    public func toFile() -> File? {
        //return isFile() ? new File(path: path) : nil
        return nil
    }

}