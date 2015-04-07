import Foundation

public class Generator {

    public struct Constants {
        public static let uppercaseLetters = Array("ABCDEFGHIJKLMNOPQRSTUVWXYZ")
        public static let letters = Array("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ")
        public static let numbers = Array("0123456789")
    }

    let parser: Parser
    let dateFormatter: NSDateFormatter

    public init(parser: Parser) {
        self.parser = parser

        dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
    }

    public func generate(key: String) -> String {
        return parser.fetch(key)
    }

    // MARK: - Filling

    public func numerify(string: String) -> String {
        let count = UInt32(Constants.numbers.count)
        return String(map(enumerate(string)) {
            (index, item) in
            let numberIndex = index == 0 ? arc4random_uniform(count - 1) + 1 :
                arc4random_uniform(count)
            let char = Constants.numbers[Int(numberIndex)]
            return item == "#" ? char : item
        })
    }

    public func letterify(string: String) -> String {
        return String(map(string.generate()) {
            let count = UInt32(Constants.uppercaseLetters.count)
            let char = Constants.uppercaseLetters[Int(arc4random_uniform(count))]
            return $0 == "?" ? char : $0
        })
    }

    public func bothify(string: String) -> String {
        return letterify(numerify(string))
    }

    public func latinify(string: String) -> String {
        var result = ""
        for char in string {
            let charString = "\(char)".lowercaseString
            if contains(Constants.letters, charString[charString.startIndex]) {
                result.append(char)
            }
        }
        return result
    }
}
