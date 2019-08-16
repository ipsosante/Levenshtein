//
//  Copyright © ipso santé.
//
//  This software is distributed under the Creative Commons (CC BY-SA 3.0) license.
//  See the LICENSE.md file in this project for more information.
//

@testable import Levenshtein
import XCTest

public class Tests: XCTestCase {
    func testReadme() {
        let dog = "Black Russian Terrier"
        let cat = "Russian Blue"
        XCTAssertEqual(Levenshtein.distance(between: dog, and: cat), 12)
    }

    func testHospitalChurch() {
        let left = "Scunthorpe General Hospital"
        let right = "Penistone Community Church"
        XCTAssertEqual(Levenshtein.distance(between: left, and: right), 24)
    }

    func testElapsedElapsing() {
        let left = "Elapsed"
        let right = "Elapsing"
        XCTAssertEqual(Levenshtein.distance(between: left, and: right), 3)
    }

    func testLifetakingLifethreatening() {
        let left = "lifetaking"
        let right = "lifethreatening"
        XCTAssertEqual(Levenshtein.distance(between: left, and: right), 6)
    }

    func testCapitals() {
        let left = "saddlebag"
        let right = "Saddlebag"
        XCTAssertEqual(Levenshtein.distance(between: left, and: right), 1)
    }

    func testPunctuation() {
        let left = "!@#$%^&*()`~"
        let right = ",./;'[]\\-="
        XCTAssertEqual(Levenshtein.distance(between: left, and: right), 12)
    }

    func testUnicode() {
        let left = "ÅÍÎÏ˝ÓÔÒÚÆ☃"
        let right = "AÍÎÏ˝ÓÔÒÚÆ☃"
        XCTAssertEqual(Levenshtein.distance(between: left, and: right), 1)
    }

    func testEmoji() {
        let left = "👾 🙇 💁 🙅 🙆 🙋 🙎 🙍 ❤️ 💔 💌 💕 💞 💓 💗 💖 💘 💝 💟 💜 💛 💚 💙"
        let right = "👾 🙇 💁 🙅 🙆 🙋 👮‍♂️ 🙍 ❤️ 💔 💌 💕 💞 💓 💗 💖 💘 💝 💟 💜 💛 💚 💙"
        XCTAssertEqual(Levenshtein.distance(between: left, and: right), 4)
    }

    func testReadmePerformance() {
        measure {
            let dog = "Black Russian Terrier"
            let cat = "Russian Blue"
            _ = Levenshtein.distance(between: dog, and: cat)
        }
    }
}
