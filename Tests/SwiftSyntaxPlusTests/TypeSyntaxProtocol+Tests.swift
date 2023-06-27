//
//  TypeSyntaxProtocol+Tests.swift
//  
//
//  Created by p-x9 on 2023/06/27.
//  
//

import XCTest
import SwiftSyntax
import SwiftSyntaxBuilder
@testable import SwiftSyntaxPlus

final class TypeSyntaxProtocolTests: XCTestCase {
    func testIsOptionalQuestionMark() {
        let decl: DeclSyntax = """
        var test: String? = ""
        """
        guard let varDecl = decl.as(VariableDeclSyntax.self),
            let binding = varDecl.bindings.first,
            let type = binding.typeAnnotation?.type else {
            XCTFail()
            return
        }

        XCTAssertTrue(type.isOptional)
    }

    func testIsOptionalGenerics() {
        let decl: DeclSyntax = """
        var test: Optional<String> = ""
        """
        guard let varDecl = decl.as(VariableDeclSyntax.self),
              let binding = varDecl.bindings.first,
              let type = binding.typeAnnotation?.type else {
            XCTFail()
            return
        }

        XCTAssertTrue(type.isOptional)
    }

    func testIsOptionalFalse() {
        let decl: DeclSyntax = """
        var test: String = ""
        """
        guard let varDecl = decl.as(VariableDeclSyntax.self),
              let binding = varDecl.bindings.first,
              let type = binding.typeAnnotation?.type else {
            XCTFail()
            return
        }

        XCTAssertFalse(type.isOptional)
    }
}
