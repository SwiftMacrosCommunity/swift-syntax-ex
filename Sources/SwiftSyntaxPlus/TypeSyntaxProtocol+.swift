//
//  TypeSyntaxProtocol+.swift
//
//
//  Created by p-x9 on 2023/06/27.
//  
//

import SwiftSyntax

extension TypeSyntaxProtocol {
    public var isOptional: Bool {
        if self.is(OptionalTypeSyntax.self) {
            return true
        }
        if let simpleType = self.as(SimpleTypeIdentifierSyntax.self),
           simpleType.name.trimmed.text == "Optional" {
            return true
        }
        return false
    }
}
