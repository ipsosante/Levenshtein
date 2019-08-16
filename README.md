# Levenshtein

[![CC BY-SA 3.0](https://img.shields.io/badge/License-CC%20BY--SA%203.0-green)](http://creativecommons.org/licenses/by-sa/3.0/)
[![Bitrise](https://img.shields.io/bitrise/206e378722bc0f6b/master?token=kR60JYTb3bs3feFtBmAaKQ)](https://app.bitrise.io/app/206e378722bc0f6b#/builds)
[![Platform](https://img.shields.io/cocoapods/p/SimpleMDM-Swift.svg)](https://alamofire.github.io/Alamofire)
![Swift version](https://img.shields.io/badge/swift-5.0-orange.svg)

Calculate the Levenshtein distance between two Strings.

Based on the implementation found at [https://en.wikibooks.org/wiki/Algorithm_Implementation/Strings/Levenshtein_distance](https://en.wikibooks.org/wiki/Algorithm_Implementation/Strings/Levenshtein_distance#Swift).

Updated for modern (5+) Swift syntax.

## Usage

```swift
let dog = "Black Russian Terrier"
let cat = "Russian Blue"
Levenshtein.distance(between: dog, and: cat) // 12
```

## License

This implementation of the Levenshtein distance is released under the CC BY-SA 3.0 license. See LICENSE.md for details.
