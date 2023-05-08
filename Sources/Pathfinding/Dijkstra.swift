import LoggingCamp
import Queueing

protocol DijkstraNodeConvertible {
    var dijkstraNode: Dijkstra.Node { get }
}

protocol DijkstraEdgeConvertible {
    var dijkstraEdge: Dijkstra.Edge { get }
}

public class Dijkstra {

    public typealias Node = Int
    public typealias Edge = (from: Node, to: Node, weight: Double)

    private var logger: Logger? = Logger("Dijkstra")

    public let nodes: [Node]
    public let edges: [Edge]

    public init(nodes: [Node], edges: [Edge]) {
        self.nodes = nodes
        self.edges = edges
    }

    public func changeLogger(to logger: Logger) {
        self.logger = logger
    }

    public func shortestPath(from source: Node, to destination: Node) -> [Node]? {
        logger?.debug("Finding shortest path from \(source) to \(destination)")
        logger?.debug("Initializing distances and previous nodes")
        var distances = [Node: Double]()
        var previous = [Node: Node]()
        logger?.debug("Initializing priority queue")
        let queue = PriorityQueue<Node>(sort: { distances[$0]! < distances[$1]! })
        logger?.debug("Initializing distances and previous nodes")
        for node in nodes {
            distances[node] = Double.infinity
            previous[node] = nil
        }
        logger?.debug("Setting source distance to 0")
        distances[source] = 0
        logger?.debug("Enqueuing source")
        queue.enqueue(source)
        while let node = queue.dequeue() {
            if node == destination {
                return reconstructPath(previous: previous, source: source, destination: destination)
            }
            for edge in edges where edge.from == node {
                logger?.debug("Relaxing edge \(edge)")
                let alt = distances[node]! + edge.weight
                if alt < distances[edge.to]! {
                    logger?.debug("Updating distance to \(edge.to) to \(alt)")
                    distances[edge.to] = alt
                    previous[edge.to] = node
                    queue.enqueue(edge.to)
                }
            }
        }
        return nil
    }

    private func reconstructPath(previous: [Node: Node], source: Node, destination: Node) -> [Node] {
        logger?.debug("(path reconstruction) Reconstructing path from \(source) to \(destination)")
        var path = [destination]
        var node = destination
        logger?.debug("(path reconstruction) Traversing previous nodes")
        while node != source {
            logger?.debug("(path reconstruction) Adding node \(node) to path")
            node = previous[node]!
            path.append(node)
        }
        logger?.debug("(path reconstruction) Returning reversed path")
        return path.reversed()
    }

}