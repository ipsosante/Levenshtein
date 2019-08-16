//
//  Copyright © ipso santé.
//
//  This software is distributed under the Creative Commons (CC BY-SA 3.0) license.
//  See the LICENSE.md file in this project for more information.
//

import Foundation

/// Levenshtein edit distance calculator.
///
/// Extracted by https://en.wikibooks.org/wiki/Algorithm_Implementation/Strings/Levenshtein_distance#Swift
/// Inspired by https://gist.github.com/bgreenlee/52d93a1d8fa1b8c1f38b
/// Improved with http://stackoverflow.com/questions/26990394/slow-swift-arrays-and-strings-performance
public enum Levenshtein {
    private struct Array2D {
        let cols: Int
        let rows: Int
        var matrix: [Int]

        init(cols: Int, rows: Int) {
            self.cols = cols
            self.rows = rows
            matrix = [Int](repeating: 0, count: cols * rows)
        }

        subscript(col: Int, row: Int) -> Int {
            get {
                return matrix[cols * row + col]
            }
            set {
                matrix[cols * row + col] = newValue
            }
        }

        func colCount() -> Int {
            return cols
        }

        func rowCount() -> Int {
            return rows
        }
    }

    /// Calculate the Levenshtein distance between two strings.
    public static func distance(between lhsStr: String, and rhsStr: String) -> Int {
        let lhsUnicode = lhsStr.unicodeScalars
        let rhsUnicode = rhsStr.unicodeScalars

        var dist = Array2D(cols: lhsUnicode.count + 1, rows: rhsUnicode.count + 1)

        for i in 1 ... lhsUnicode.count {
            dist[i, 0] = i
        }

        for j in 1 ... rhsUnicode.count {
            dist[0, j] = j
        }

        for i in 1 ... lhsUnicode.count {
            for j in 1 ... rhsUnicode.count {
                let lhsIndex = lhsUnicode.index(lhsUnicode.startIndex, offsetBy: i - 1)
                let rhsIndex = rhsUnicode.index(rhsUnicode.startIndex, offsetBy: j - 1)
                if lhsUnicode[lhsIndex] == rhsUnicode[rhsIndex] {
                    dist[i, j] = dist[i - 1, j - 1] // noop
                } else {
                    let deletion = dist[i - 1, j] + 1
                    let insertion = dist[i, j - 1] + 1
                    let substitution = dist[i - 1, j - 1] + 1
                    dist[i, j] = min(min(deletion, insertion), substitution)
                }
            }
        }

        return dist[lhsUnicode.count, rhsUnicode.count]
    }
}
