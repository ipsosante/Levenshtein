# Levenshtein

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
