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
        ok
        error {
          __typename
          code
          msg
        }
        data {
          __typename
          list {
            __typename
            _id
            name
            code
            zoneinfo {
              __typename
              tz
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
          GraphQLField("ok", type: .nonNull(.scalar(Bool.self))),
          GraphQLField("error", type: .object(Error.selections)),
          GraphQLField("data", type: .object(Datum.selections)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(ok: Bool, error: Error? = nil, data: Datum? = nil) {
        self.init(unsafeResultMap: ["__typename": "GetStoreGroupByCodeResponse", "ok": ok, "error": error.flatMap { (value: Error) -> ResultMap in value.resultMap }, "data": data.flatMap { (value: Datum) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var ok: Bool {
        get {
          return resultMap["ok"]! as! Bool
        }
        set {
          resultMap.updateValue(newValue, forKey: "ok")
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

      public var data: Datum? {
        get {
          return (resultMap["data"] as? ResultMap).flatMap { Datum(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "data")
        }
      }

      public struct Error: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Err"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("code", type: .scalar(String.self)),
            GraphQLField("msg", type: .scalar(String.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(code: String? = nil, msg: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "Err", "code": code, "msg": msg])
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

        public var msg: String? {
          get {
            return resultMap["msg"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "msg")
          }
        }
      }

      public struct Datum: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["StoreGroup"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("list", type: .list(.nonNull(.object(List.selections)))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(list: [List]? = nil) {
          self.init(unsafeResultMap: ["__typename": "StoreGroup", "list": list.flatMap { (value: [List]) -> [ResultMap] in value.map { (value: List) -> ResultMap in value.resultMap } }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var list: [List]? {
          get {
            return (resultMap["list"] as? [ResultMap]).flatMap { (value: [ResultMap]) -> [List] in value.map { (value: ResultMap) -> List in List(unsafeResultMap: value) } }
          }
          set {
            resultMap.updateValue(newValue.flatMap { (value: [List]) -> [ResultMap] in value.map { (value: List) -> ResultMap in value.resultMap } }, forKey: "list")
          }
        }

        public struct List: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["Store"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("_id", type: .nonNull(.scalar(GraphQLID.self))),
              GraphQLField("name", type: .nonNull(.scalar(String.self))),
              GraphQLField("code", type: .nonNull(.scalar(String.self))),
              GraphQLField("zoneinfo", type: .nonNull(.object(Zoneinfo.selections))),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(_id: GraphQLID, name: String, code: String, zoneinfo: Zoneinfo) {
            self.init(unsafeResultMap: ["__typename": "Store", "_id": _id, "name": name, "code": code, "zoneinfo": zoneinfo.resultMap])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var _id: GraphQLID {
            get {
              return resultMap["_id"]! as! GraphQLID
            }
            set {
              resultMap.updateValue(newValue, forKey: "_id")
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

          public var zoneinfo: Zoneinfo {
            get {
              return Zoneinfo(unsafeResultMap: resultMap["zoneinfo"]! as! ResultMap)
            }
            set {
              resultMap.updateValue(newValue.resultMap, forKey: "zoneinfo")
            }
          }

          public struct Zoneinfo: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["Zoneinfo"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("tz", type: .nonNull(.scalar(String.self))),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(tz: String) {
              self.init(unsafeResultMap: ["__typename": "Zoneinfo", "tz": tz])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            public var tz: String {
              get {
                return resultMap["tz"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "tz")
              }
            }
          }
        }
      }
    }
  }
}
