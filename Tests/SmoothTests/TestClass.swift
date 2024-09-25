import Basis

public class TestClass: DictionaryWrapper<String, String> {

    public init() {
        super.init([:])
    }

    public func test() {
        print("test")
    }

}