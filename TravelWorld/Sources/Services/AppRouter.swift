import Alamofire

enum AppRouter: URLRequestConvertible {
    case getAppInfo

    var method: HTTPMethod {
        switch self {
        case .getAppInfo:
            return .get
        }
    }

    var path: String {
        switch self {
        case .getAppInfo :
            return "/api/appinfo"
        }
    }
    // MARK: URLRequestConvertible
    func asURLRequest() throws -> URLRequest {
        let url = try Config.baseUrl.asURL()

        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        urlRequest.httpMethod = method.rawValue

        switch self {
        case .getAppInfo:
            urlRequest = try JSONEncoding.default.encode(urlRequest, with: nil)
        }

        return urlRequest
    }
}
