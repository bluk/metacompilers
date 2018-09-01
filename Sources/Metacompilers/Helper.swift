//
//  Helper.swift
//  Metacompilers
//
//  Created by Bryant Luk on 8/31/18.
//

import Foundation

public struct NodeParameter {
    public enum ParameterType {
        case literal(String)
        case bool(Bool)
        case keyValue(String, String)
        case string(String)
    }
}

public class Node {

    public enum NodeType {
        case root
        case text
        case statement
        case expression
        case comment
        case output
        case rule
        case leftMargin(margin: Int)
        case helper(name: String)
        case and
        case or
        case zeroOrMore
    }

    public let type: NodeType
    public var content: String?
    public var parameters: [NodeParameter] = []
    public var children: [Node] = []

    public init(type: NodeType) {
        self.type = type
    }
}
