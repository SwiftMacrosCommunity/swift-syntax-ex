//
//  FunctionDeclSyntax+Tests.swift
//  
//
//  Created by p-x9 on 2023/06/25.
//  
//

import XCTest
import SwiftSyntax
import SwiftSyntaxBuilder
@testable import SwiftSyntaxPlus

final class FunctionDeclSyntaxTests: XCTestCase {
    func testCallFunction() {
        let decl: DeclSyntax = """
        func test(_ arg1: String, to arg2: String) {}
        """

        guard let functionDecl: FunctionDeclSyntax = decl.as(FunctionDeclSyntax.self) else {
            XCTFail()
            return
        }

        let expr = functionDecl.call(
            calledExpression: MemberAccessExprSyntax(
                base: IdentifierExprSyntax(identifier: "self"),
                dot: .periodToken(),
                name: functionDecl.identifier.trimmed
            ),
            arguments: [
                .identifier("text"),
                .identifier("text2")
            ]
        ).formatted()

        let expected = """
        self.test(text, to: text2)
        """

        XCTAssertEqual(expected, expr.description)
    }

    func testCallFunctionWithSameArguments() {
        let decl: DeclSyntax = """
        func test(_ arg1: String, to arg2: String) {}
        """

        guard let functionDecl: FunctionDeclSyntax = decl.as(FunctionDeclSyntax.self) else {
            XCTFail()
            return
        }

        let expr = functionDecl.callWithSameArguments(
            calledExpression: MemberAccessExprSyntax(
                base: IdentifierExprSyntax(identifier: "self"),
                dot: .periodToken(),
                name: functionDecl.identifier.trimmed
            )
        ).formatted()

        let expected = """
        self.test(arg1, to: arg2)
        """

        XCTAssertEqual(expected, expr.description)
    }
}
