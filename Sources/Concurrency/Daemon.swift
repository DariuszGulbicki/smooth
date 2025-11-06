import Foundation

public class Daemon {

    private let daemonQueue = DispatchQueue(label: "DaemonQueue", attributes: .concurrent)

    private var daemon: (() -> Void)

    public init(daemon: @escaping () -> Void) {
        self.daemon = daemon
        start()
    }

    public func start() {
        daemonQueue.async {
            while true {
                // TODO: Fix this
                //self.daemon()
            }
        }
    }

    public func suspend() {
        daemonQueue.suspend()
    }

    public func resume() {
        daemonQueue.resume()
    }

    public func stop() {
        suspend()
    }

}