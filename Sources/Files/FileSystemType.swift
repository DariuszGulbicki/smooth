public enum FileSystemType {
    case file
    case directory
    case symlink
    case unknown
}

extension FileSystemType: CustomStringConvertible {
    public var description: String {
        switch self {
        case .file:
            return "file"
        case .directory:
            return "directory"
        case .symlink:
            return "symlink"
        case .unknown:
            return "unknown"
        }
    }
}