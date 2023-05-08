# Smooth

A set of utilities for Swift

## Installation

### Swift Package Manager

Add the following to your `Package.swift` file:

```swift
    .package(url: "https://github.com/DariuszGulbicki/smooth.git", from: "0.1.0")
```

## Algorithms

Smooth provides a set of algorithms that can be used to solve common problems.

| Problem | Algorithm | Description | Complexity | Usage |
| ------- | --------- | ----------- | ---------- | ----- |
| Path finding | Dijkstra | Finds the shortest path between two nodes in a graph | O(E + V log V) | `Dijkstra.shortestPath(from:to:in:)` |
| String Similarity | Levenshtein | Calculates the Levenshtein distance between two strings | O(mn) | `string.levenshteinDistance(from:to:)` |
| Queueing | PriorityQueue | A priority queue implementation | O(log n) | `PriorityQueue(sorter: Sorter())` |
| Templating | Template | A simple templating engine | O(n) | `Template(template: "Hello {{name}}").render(["name": "World"])` |

## Contributing

Contributions are welcome and encouraged!
Before submitting a pull request, please make sure that your changes pass the tests and SwiftLint.

## License

Smooth is released under the MIT license. See [LICENSE](LICENSE) for details.