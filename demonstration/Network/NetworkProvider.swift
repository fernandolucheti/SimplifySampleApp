//
//  NetworkProvider.swift
//  demonstration
//
//  Created by Fernando Lucheti on 19/10/22.
//

import Moya

final class NetworkProvider<RequestType: TargetType> {
    
    private let provider: MoyaProvider<RequestType>
    
    init(stubClosure: @escaping MoyaProvider<RequestType>.StubClosure = MoyaProvider.neverStub) {
        self.provider = MoyaProvider<RequestType>(stubClosure: stubClosure)
    }
    
    func request<ResponseType: Decodable>(_ target: RequestType, completion: @escaping (Result<ResponseType, NetworkErrors>) -> Void) {
        
        provider.request(target) { result in
            switch result {
            case.success(let response):
                do {
                    let responseModel = try response.map(ResponseType.self)
                    completion(.success(responseModel))
                } catch {
                    completion(.failure(NetworkErrors.decoding))
                }
            case .failure:
                completion(.failure(NetworkErrors.generic))
            }
        }
    }
}
