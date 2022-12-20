// RUN: %empty-directory(%t)

// RUN: %target-swift-frontend -module-name Logging -package-name My-Logging%Pkg %t/File.swift -emit-module -emit-module-path %t/Logging.swiftmodule | %FileCheck %s -check-prefix CHECK-BAD
// CHECK-BAD: package name "My-Logging%Pkg" is not a valid identifier

// RUN: %target-swift-frontend -module-name Logging -package-name Swift %t/File.swift -emit-module -emit-module-path %t/Logging.swiftmodule | %FileCheck %s -check-prefix CHECK-STDLIB
// CHECK-STDLIB: package name "Swift" is reserved for the standard library


// BEGIN File.swift
public func log(level: Int) {}

