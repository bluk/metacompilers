//
//  Helper.swift
//  Metacompilers
//
//  Created by Bryant Luk on 8/31/18.
//

import Foundation

public class Node {

    public enum NodeType {
        case root

        case rule(value: String)
        case leftMargin(margin: Int)
        case comment(value: String)
        case output
        case and
        case or
        case zeroOrMore

        case readCharacter
        case string(value: String)
        case id(value: String)
        case empty

        case charEqual
        case charLessThanOrEqual
        case charGreaterThanOrEqual
        case charExpression

        case number(value: String)
        case character(value: String)

        case tokenExpression
        case tokenAny
        case tokenAnyBut
        case tokenStart
        case tokenEnd

        case text(value: String)
    }

    public let type: NodeType
    public var children: [Node] = []

    public init(type: NodeType) {
        self.type = type
    }
}
