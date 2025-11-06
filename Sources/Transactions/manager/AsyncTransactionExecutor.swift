import Foundation

class AsyncTransactionExecutor {
    private let transactionQueue: DispatchQueue

    init(queueLabel: String = "smooth.transactions") {
        self.transactionQueue = DispatchQueue(label: queueLabel, attributes: .blocking)
    }

    func execute(transaction: @escaping () -> Void) {
        transactionQueue.async {
            transaction()
        }
    }
}