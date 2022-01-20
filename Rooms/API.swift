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
          storeList: list {
            __typename
            identifier: _id
            name
            code
            region: zoneinfo {
              __typename
              timeZone: tz
            }
            productList: products {
              __typename
              identifier: _id
              name
              subtitle: subTitle
              code
              imageList: images
              informationList: infos {
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
            GraphQLField("list", alias: "storeList", type: .list(.nonNull(.object(StoreList.selections)))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(storeList: [StoreList]? = nil) {
          self.init(unsafeResultMap: ["__typename": "StoreGroup", "storeList": storeList.flatMap { (value: [StoreList]) -> [ResultMap] in value.map { (value: StoreList) -> ResultMap in value.resultMap } }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var storeList: [StoreList]? {
          get {
            return (resultMap["storeList"] as? [ResultMap]).flatMap { (value: [ResultMap]) -> [StoreList] in value.map { (value: ResultMap) -> StoreList in StoreList(unsafeResultMap: value) } }
          }
          set {
            resultMap.updateValue(newValue.flatMap { (value: [StoreList]) -> [ResultMap] in value.map { (value: StoreList) -> ResultMap in value.resultMap } }, forKey: "storeList")
          }
        }

        public struct StoreList: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["Store"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("_id", alias: "identifier", type: .nonNull(.scalar(GraphQLID.self))),
              GraphQLField("name", type: .nonNull(.scalar(String.self))),
              GraphQLField("code", type: .nonNull(.scalar(String.self))),
              GraphQLField("zoneinfo", alias: "region", type: .nonNull(.object(Region.selections))),
              GraphQLField("products", alias: "productList", type: .list(.nonNull(.object(ProductList.selections)))),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(identifier: GraphQLID, name: String, code: String, region: Region, productList: [ProductList]? = nil) {
            self.init(unsafeResultMap: ["__typename": "Store", "identifier": identifier, "name": name, "code": code, "region": region.resultMap, "productList": productList.flatMap { (value: [ProductList]) -> [ResultMap] in value.map { (value: ProductList) -> ResultMap in value.resultMap } }])
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

          public var productList: [ProductList]? {
            get {
              return (resultMap["productList"] as? [ResultMap]).flatMap { (value: [ResultMap]) -> [ProductList] in value.map { (value: ResultMap) -> ProductList in ProductList(unsafeResultMap: value) } }
            }
            set {
              resultMap.updateValue(newValue.flatMap { (value: [ProductList]) -> [ResultMap] in value.map { (value: ProductList) -> ResultMap in value.resultMap } }, forKey: "productList")
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

          public struct ProductList: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["Product"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("_id", alias: "identifier", type: .nonNull(.scalar(GraphQLID.self))),
                GraphQLField("name", type: .nonNull(.scalar(String.self))),
                GraphQLField("subTitle", alias: "subtitle", type: .scalar(String.self)),
                GraphQLField("code", type: .nonNull(.scalar(String.self))),
                GraphQLField("images", alias: "imageList", type: .list(.nonNull(.scalar(String.self)))),
                GraphQLField("infos", alias: "informationList", type: .list(.nonNull(.object(InformationList.selections)))),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(identifier: GraphQLID, name: String, subtitle: String? = nil, code: String, imageList: [String]? = nil, informationList: [InformationList]? = nil) {
              self.init(unsafeResultMap: ["__typename": "Product", "identifier": identifier, "name": name, "subtitle": subtitle, "code": code, "imageList": imageList, "informationList": informationList.flatMap { (value: [InformationList]) -> [ResultMap] in value.map { (value: InformationList) -> ResultMap in value.resultMap } }])
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

            public var imageList: [String]? {
              get {
                return resultMap["imageList"] as? [String]
              }
              set {
                resultMap.updateValue(newValue, forKey: "imageList")
              }
            }

            public var informationList: [InformationList]? {
              get {
                return (resultMap["informationList"] as? [ResultMap]).flatMap { (value: [ResultMap]) -> [InformationList] in value.map { (value: ResultMap) -> InformationList in InformationList(unsafeResultMap: value) } }
              }
              set {
                resultMap.updateValue(newValue.flatMap { (value: [InformationList]) -> [ResultMap] in value.map { (value: InformationList) -> ResultMap in value.resultMap } }, forKey: "informationList")
              }
            }

            public struct InformationList: GraphQLSelectionSet {
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
