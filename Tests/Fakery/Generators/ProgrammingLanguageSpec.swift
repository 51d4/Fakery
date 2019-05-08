import Quick
import Nimble
@testable import Fakery

final class ProgrammingLanguageSpec: QuickSpec {
  override func spec() {
    describe("Programming Language") {
      var language: ProgrammingLanguage!

      beforeEach {
        let parser = Parser(locale: "en-TEST")
        language = ProgrammingLanguage(parser: parser)
      }

      describe("#name") {
        it("returns the correct text") {
          let name = language.name()
          expect(name).to(equal("Elixir"))
        }
      }
    }
  }
}
