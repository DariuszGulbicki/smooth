import Foundation

public enum FileSystemOperationError: Error {
    case elementTypeMismatch(expected: FileSystemType, found: FileSystemType)
    case elementNotFound
    case elementAlreadyExists
    case operationNotPermitted(operation: String)
    
    public var path: String {
        switch self {
            case .elementTypeMismatch(let path, _, _),
                 .elementNotFound(let path),
                 .elementAlreadyExists(let path),
                 .operationNotPermitted(let path, _):
                return path
        }
    }
}

extension FileSystemOperationError: LocalizedError {
    public var errorDescription: String? {
        switch self {
            case .typeMismatch(let expected, let found):
                return "Type mismatch: expected \(expected), but found \(found)."
            case .elementNotFound(let path):
                return "Element not found at path: \(path)."
            case .elementAlreadyExists(let path):
                return "Element already exists at path: \(path)."
        }
    }
}