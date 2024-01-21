import Foundation

public class MultipartFormEncoding {

    public static func encode(_ parameters: [String: Any]) -> Data {
        let boundary = "Boundary-\(UUID().uuidString)"
        var body = Data()
        for (key, value) in parameters {
            body.append(contentsOf: "--\(boundary)\r\n".utf8)
            body.append(contentsOf: "Content-Disposition: form-data; name=\"\(key)\"\r\n\r\n".utf8)
            body.append(contentsOf: "\(value)\r\n".utf8)
        }
        body.append(contentsOf: "--\(boundary)--\r\n".utf8)
        return body
    }

    public static func decode(_ data: Data) -> [String: Any] {
        var parameters = [String: Any]()
        let boundary = "Boundary-\(UUID().uuidString)"
        let components = String(data: data, encoding: .utf8)?.components(separatedBy: "--\(boundary)")
        for component in components ?? [] {
            if component.contains("Content-Disposition") {
                let subcomponents = component.components(separatedBy: "\r\n")
                if subcomponents.count > 2 {
                    let key = subcomponents[1].components(separatedBy: "\"")[1]
                    let value = subcomponents[3]
                    parameters[key] = value
                }
            }
        }
        return parameters
    }

    public static func decode(_ text: String) -> [String: Any] {
        var parameters = [String: Any]()
        let boundary = "Boundary-\(UUID().uuidString)"
        let components = text.components(separatedBy: "--\(boundary)")
        for component in components {
            if component.contains("Content-Disposition") {
                let subcomponents = component.components(separatedBy: "\r\n")
                if subcomponents.count > 2 {
                    let key = subcomponents[1].components(separatedBy: "\"")[1]
                    let value = subcomponents[3]
                    parameters[key] = value
                }
            }
        }
        return parameters
    }

}

public class MultipartFormEncoder {

    private var data: [String:Any] = [:]

    public init() {}

    public func add(_ key: String, _ value: Any) -> MultipartFormEncoder {
        self.data[key] = value
        return self
    }

    public func encode() -> Data {
        return MultipartFormEncoding.encode(self.data)
    }

}