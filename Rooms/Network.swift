import Foundation

import Apollo

public final class Network {
    public static let shared: Network = Network()
    
    private(set) lazy var apollo = ApolloClient(url: URL(string: "https://api.space.stayjanda.cloud/graphql")!)
}
