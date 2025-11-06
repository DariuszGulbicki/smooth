import Foundation

/// # TransactionGroupExecutionManager
/// 
/// **Group Execution Managers should be created using the `TransactionManager` class to make them accessible globally
/// and aviod creating multiple instances of the same group.**
/// 
/// The `TransactionGroupExecutionManager` is a class that manages the execution of transactions in a single group.
/// It ensures that transactions are executed in the correct order, resources are not overused and that only one
/// transaction is executed per resource at a time.
public class TransactionGroupExecutionManager {

    private let groupCleanupCooldown: TimeInterval? = nil

    public var cleanupCooldown: TimeInterval {
        get {
            return groupCleanupCooldown ?? TransactionManager.globalCleanupCooldown
        }
        set {
            groupCleanupCooldown = newValue
        }
    }

    public private(set) var groupIdentifier: String

    public init(groupIdentifier: String) {
        self.groupIdentifier = groupIdentifier
    }

}