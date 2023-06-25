//
//  VariableDeclSyntax+Tests.swift
//  
//
//  Created by p-x9 on 2023/06/25.
//  
//

import XCTest
import SwiftSyntax
import SwiftSyntaxBuilder
@testable import SwiftSyntaxPlus

final class VariableDeclSyntaxTests: XCTestCase {
    func testIsLet() {
        let letVariable = VariableDeclSyntax(
            .let,
            name: .init(IdentifierPatternSyntax(identifier: .identifier("value")))
        )

        let varVariable = VariableDeclSyntax(
            .var,
            name: .init(IdentifierPatternSyntax(identifier: .identifier("value")))
        )

        XCTAssertTrue(letVariable.isLet)
        XCTAssertFalse(varVariable.isLet)
    }

    func testIsVar() {
        let letVariable = VariableDeclSyntax(
            .let,
            name: .init(IdentifierPatternSyntax(identifier: .identifier("value")))
        )

        let varVariable = VariableDeclSyntax(
            .var,
            name: .init(IdentifierPatternSyntax(identifier: .identifier("value")))
        )

        XCTAssertFalse(letVariable.isVar)
        XCTAssertTrue(varVariable.isVar)
    }
}

