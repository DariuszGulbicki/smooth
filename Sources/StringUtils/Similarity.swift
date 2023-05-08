public enum StringDistanceCalulationMethod {
    case levenshtein
}

public enum StringSimilartyCalulationMethod {
    case levenshtein
    case levenshteinSum
}

public extension String {

    // Distance calculation

    public func levenshteinDistance(to: String) -> Int {
        let m = self.count
        let n = to.count
        var d = [[Int]](repeating: [Int](repeating: 0, count: n + 1), count: m + 1)
        for i in 1...m {
            d[i][0] = i
        }
        for j in 1...n {
            d[0][j] = j
        }
        for j in 1...n {
            for i in 1...m {
                if self[i - 1] == to[j - 1] {
                    d[i][j] = d[i - 1][j - 1]
                } else {
                    d[i][j] = min(d[i - 1][j] + 1, d[i][j - 1] + 1, d[i - 1][j - 1] + 1)
                }
            }
        }
        return d[m][n]
    }

    public func distance(to: String, method: StringDistanceCalulationMethod = .levenshtein) -> Int {
        switch method {
            case .levenshtein:
                return levenshteinDistance(to: to)
        }
    }

    // Similarity calculation

    // Levenshtein sum similarity is the sum of the Levenshtein distances between each word in the string.
    public func levenshteinSumSimilarity(to: String) -> Int {
        let thisStrings = self.split(separator: " ")
        let toStrings = to.split(separator: " ")
        var sum = 0
        for thisString in thisStrings {
            for toString in toStrings {
                sum += thisString.levenshteinDistance(to: String(toString))
            }
        }
        return sum
    }

    public func isSimilar(to: String, threshold: Int = 3, method: StringSimilarityCalulationMethod = .levenshteinSum) -> Bool {
        switch method {
            case .levenshtein:
                return levenshteinDistance(to: to) <= threshold
            case .levenshteinSum:
                return levenshteinSumSimilarity(to: to) <= threshold
        }
    }

}