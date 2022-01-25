// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public final class GetGroupQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query GetGroup($groupCode: String!) {
      group: GetStoreGroupByCode(param: {groupCode: $groupCode}) {
        __typename
        success: ok
        error {
          __typename
          code
          message: msg
        }
        response: data {
          __typename
          stores: list {
            __typename
            identifier: _id
            name
            code
            region: zoneinfo {
              __typename
              timeZone: tz
            }
            products {
              __typename
              identifier: _id
              name
              subtitle: subTitle
              code
              images
              informations: infos {
                __typename
                identifier: key
                title: label
                message: content
              }
            }
          }
        }
      }
    }
    """

  public let operationName: String = "GetGroup"

  public var groupCode: String

  public init(groupCode: String) {
    self.groupCode = groupCode
  }

  public var variables: GraphQLMap? {
    return ["groupCode": groupCode]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("GetStoreGroupByCode", alias: "group", arguments: ["param": ["groupCode": GraphQLVariable("groupCode")]], type: .nonNull(.object(Group.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(group: Group) {
      self.init(unsafeResultMap: ["__typename": "Query", "group": group.resultMap])
    }

    public var group: Group {
      get {
        return Group(unsafeResultMap: resultMap["group"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "group")
      }
    }

    public struct Group: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["GetStoreGroupByCodeResponse"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("ok", alias: "success", type: .nonNull(.scalar(Bool.self))),
          GraphQLField("error", type: .object(Error.selections)),
          GraphQLField("data", alias: "response", type: .object(Response.selections)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(success: Bool, error: Error? = nil, response: Response? = nil) {
        self.init(unsafeResultMap: ["__typename": "GetStoreGroupByCodeResponse", "success": success, "error": error.flatMap { (value: Error) -> ResultMap in value.resultMap }, "response": response.flatMap { (value: Response) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var success: Bool {
        get {
          return resultMap["success"]! as! Bool
        }
        set {
          resultMap.updateValue(newValue, forKey: "success")
        }
      }

      public var error: Error? {
        get {
          return (resultMap["error"] as? ResultMap).flatMap { Error(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "error")
        }
      }

      public var response: Response? {
        get {
          return (resultMap["response"] as? ResultMap).flatMap { Response(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "response")
        }
      }

      public struct Error: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Err"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("code", type: .scalar(String.self)),
            GraphQLField("msg", alias: "message", type: .scalar(String.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(code: String? = nil, message: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "Err", "code": code, "message": message])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var code: String? {
          get {
            return resultMap["code"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "code")
          }
        }

        public var message: String? {
          get {
            return resultMap["message"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "message")
          }
        }
      }

      public struct Response: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["StoreGroup"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("list", alias: "stores", type: .list(.nonNull(.object(Store.selections)))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(stores: [Store]? = nil) {
          self.init(unsafeResultMap: ["__typename": "StoreGroup", "stores": stores.flatMap { (value: [Store]) -> [ResultMap] in value.map { (value: Store) -> ResultMap in value.resultMap } }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var stores: [Store]? {
          get {
            return (resultMap["stores"] as? [ResultMap]).flatMap { (value: [ResultMap]) -> [Store] in value.map { (value: ResultMap) -> Store in Store(unsafeResultMap: value) } }
          }
          set {
            resultMap.updateValue(newValue.flatMap { (value: [Store]) -> [ResultMap] in value.map { (value: Store) -> ResultMap in value.resultMap } }, forKey: "stores")
          }
        }

        public struct Store: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["Store"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("_id", alias: "identifier", type: .nonNull(.scalar(GraphQLID.self))),
              GraphQLField("name", type: .nonNull(.scalar(String.self))),
              GraphQLField("code", type: .nonNull(.scalar(String.self))),
              GraphQLField("zoneinfo", alias: "region", type: .nonNull(.object(Region.selections))),
              GraphQLField("products", type: .list(.nonNull(.object(Product.selections)))),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(identifier: GraphQLID, name: String, code: String, region: Region, products: [Product]? = nil) {
            self.init(unsafeResultMap: ["__typename": "Store", "identifier": identifier, "name": name, "code": code, "region": region.resultMap, "products": products.flatMap { (value: [Product]) -> [ResultMap] in value.map { (value: Product) -> ResultMap in value.resultMap } }])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var identifier: GraphQLID {
            get {
              return resultMap["identifier"]! as! GraphQLID
            }
            set {
              resultMap.updateValue(newValue, forKey: "identifier")
            }
          }

          public var name: String {
            get {
              return resultMap["name"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "name")
            }
          }

          public var code: String {
            get {
              return resultMap["code"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "code")
            }
          }

          public var region: Region {
            get {
              return Region(unsafeResultMap: resultMap["region"]! as! ResultMap)
            }
            set {
              resultMap.updateValue(newValue.resultMap, forKey: "region")
            }
          }

          public var products: [Product]? {
            get {
              return (resultMap["products"] as? [ResultMap]).flatMap { (value: [ResultMap]) -> [Product] in value.map { (value: ResultMap) -> Product in Product(unsafeResultMap: value) } }
            }
            set {
              resultMap.updateValue(newValue.flatMap { (value: [Product]) -> [ResultMap] in value.map { (value: Product) -> ResultMap in value.resultMap } }, forKey: "products")
            }
          }

          public struct Region: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["Zoneinfo"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("tz", alias: "timeZone", type: .nonNull(.scalar(String.self))),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(timeZone: String) {
              self.init(unsafeResultMap: ["__typename": "Zoneinfo", "timeZone": timeZone])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            public var timeZone: String {
              get {
                return resultMap["timeZone"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "timeZone")
              }
            }
          }

          public struct Product: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["Product"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("_id", alias: "identifier", type: .nonNull(.scalar(GraphQLID.self))),
                GraphQLField("name", type: .nonNull(.scalar(String.self))),
                GraphQLField("subTitle", alias: "subtitle", type: .scalar(String.self)),
                GraphQLField("code", type: .nonNull(.scalar(String.self))),
                GraphQLField("images", type: .list(.nonNull(.scalar(String.self)))),
                GraphQLField("infos", alias: "informations", type: .list(.nonNull(.object(Information.selections)))),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(identifier: GraphQLID, name: String, subtitle: String? = nil, code: String, images: [String]? = nil, informations: [Information]? = nil) {
              self.init(unsafeResultMap: ["__typename": "Product", "identifier": identifier, "name": name, "subtitle": subtitle, "code": code, "images": images, "informations": informations.flatMap { (value: [Information]) -> [ResultMap] in value.map { (value: Information) -> ResultMap in value.resultMap } }])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            public var identifier: GraphQLID {
              get {
                return resultMap["identifier"]! as! GraphQLID
              }
              set {
                resultMap.updateValue(newValue, forKey: "identifier")
              }
            }

            public var name: String {
              get {
                return resultMap["name"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "name")
              }
            }

            public var subtitle: String? {
              get {
                return resultMap["subtitle"] as? String
              }
              set {
                resultMap.updateValue(newValue, forKey: "subtitle")
              }
            }

            public var code: String {
              get {
                return resultMap["code"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "code")
              }
            }

            public var images: [String]? {
              get {
                return resultMap["images"] as? [String]
              }
              set {
                resultMap.updateValue(newValue, forKey: "images")
              }
            }

            public var informations: [Information]? {
              get {
                return (resultMap["informations"] as? [ResultMap]).flatMap { (value: [ResultMap]) -> [Information] in value.map { (value: ResultMap) -> Information in Information(unsafeResultMap: value) } }
              }
              set {
                resultMap.updateValue(newValue.flatMap { (value: [Information]) -> [ResultMap] in value.map { (value: Information) -> ResultMap in value.resultMap } }, forKey: "informations")
              }
            }

            public struct Information: GraphQLSelectionSet {
              public static let possibleTypes: [String] = ["Info"]

              public static var selections: [GraphQLSelection] {
                return [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("key", alias: "identifier", type: .nonNull(.scalar(String.self))),
                  GraphQLField("label", alias: "title", type: .nonNull(.scalar(String.self))),
                  GraphQLField("content", alias: "message", type: .nonNull(.scalar(String.self))),
                ]
              }

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(identifier: String, title: String, message: String) {
                self.init(unsafeResultMap: ["__typename": "Info", "identifier": identifier, "title": title, "message": message])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              public var identifier: String {
                get {
                  return resultMap["identifier"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "identifier")
                }
              }

              public var title: String {
                get {
                  return resultMap["title"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "title")
                }
              }

              public var message: String {
                get {
                  return resultMap["message"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "message")
                }
              }
            }
          }
        }
      }
    }
  }
}
