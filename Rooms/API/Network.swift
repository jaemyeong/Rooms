import Foundation

import Apollo

public final class Network {
    public static let shared: Network = Network()
    
    public private(set) lazy var apollo: ApolloClient = ApolloClient(url: URL(string: "https://api.space.stayjanda.cloud/graphql")!)
}
