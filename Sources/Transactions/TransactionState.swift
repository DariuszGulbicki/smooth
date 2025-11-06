/// Represents possible states of a transaction.
enum TransactionState {
    /// The transaction is pending and has not been executed yet.
    case pending
    /// The transaction is currently being executed.
    /// 
    /// Any changes made by the transaction are not yet committed.
    case executing
    /// The transaction has been rolled back.
    case rolledBack
    /// The transaction has been committed.
    case commited
}