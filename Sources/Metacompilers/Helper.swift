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

        case rule
        case leftMargin(margin: Int)
        case comment
        case output
        case and
        case or
        case zeroOrMore

        case readCharacter
        case string
        case id
        case empty

        case charEqual
        case charLessThanOrEqual
        case charGreaterThanOrEqual

        case number(value: String)
        case character(value: String)

        case text
        case statement
        case expression
        case helper(name: String)
    }

    public let type: NodeType
    public var content: String?
    public var parameters: [NodeParameter] = []
    public var children: [Node] = []

    public init(type: NodeType) {
        self.type = type
    }
}
