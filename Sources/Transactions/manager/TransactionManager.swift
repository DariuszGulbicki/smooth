import Foundation

/// # TransactionManager
/// 
/// The `TransactionManager` is a singleton that manages all transaction groups and resources.
/// It allows to easily create and execute transactions asynchroniously while making sure that
/// transactions are executed in the correct order, resources are not overused and that only one
/// transaction is executed per resource at a time.
/// 
/// ## Usage
/// 
/// ```swift
/// let transaction = Transaction()
/// 
/// // Add steps to the transaction here
/// 
/// // Transaction will be executed asynchroniously when resource ('resource')
/// // and its parent resources ('great' and 'my') are available.
/// TransactionManager.for("MyGreatApp").queueForExecution(my.great.resource, transaction)
/// ```
public class TransactionManager {

    private static var _globalCleanupCooldown: TimeInterval = 60

    /// The global cleanup cooldown that is used by default when cooldown for group or resource is not set.
    /// 
    /// Execution queues for resources that have not been used for `globalCleanupCooldown` seconds will be destroyed 
    /// to free up resources.
    /// 
    /// Setting this value to 0 will destroy queues immidiately after all queued transactions have been executed.
    private static var globalCleanupCooldown: TimeInterval {
        get {
            return _globalCleanupCooldown
        }
        set {
            _globalCleanupCooldown = (newValue > 0) ? newValue : 0
        }
    }

    /// The transaction groups that are managed by the `TransactionManager`.
    /// 
    /// Each group can represent a different part of the application (database, network, etc.) and can have its own
    /// unique parameters.
    /// 
    /// Used for isolating transactions, semaphores, dispatch queues and resources.
    private var groups: [String: TransactionGroupExecutionManager] = [:]

    /// Accesses the transaction group execution manager for the specified group.
    /// 
    /// If the group does not exist, it will be created.
    /// 
    /// Each group is its own isolated environment with its resources.
    /// Groups can be used to isolate execution for different parts of the application
    /// (database, network, etc.) and can have their own unique parameters.
    /// 
    /// - Parameter group: The identifier of the group.
    /// - Returns: The transaction group execution manager for the specified group.
    public static func `for`(_ group: String) -> TransactionGroupExecutionManager {
        if let group = groups[group] {
            return group
        } else {
            let group = TransactionGroupExecutionManager(groupIdentifier: group)
            groups[group] = group
            return group
        }
    }

}