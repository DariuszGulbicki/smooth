/// A transaction is a series of steps that can be committed.
/// 
/// They are used to group a series of operations together that should be executed atomically.
/// 
/// If any operation in the transaction fails, the transaction should be rolled back.
public protocol Transaction<TransactionObject> {

    associatedtype TransactionObject

    associatedtype Step = (TransactionObject) throws -> Void
    associatedtype RollbackStep = (TransactionObject) -> Void

    public private(set) let id = UUID()
    public private(set) let createdAt = Date()

    public private(set) var state: State = .pending

    func addStep(_ step: Step, _ rollback: RollbackStep)

    func rollback(_ :TransactionObject)

    func commit(_ :TransactionObject)

}