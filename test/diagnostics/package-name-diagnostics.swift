// RUN: %empty-directory(%t)
// RUN: %{python} %utils/split_file.py -o %t %s

// RUN: %target-swift-frontend -module-name Logging -package-name My-Logging%Pkg %t/File.swift -emit-module -emit-module-path %t/Logging.swiftmodule | %FileCheck %s -check-prefix CHECK-BAD
// CHECK-BAD: package name "My-Logging%Pkg" is not a valid identifier

// RUN: %target-swift-frontend -module-name Logging -package-name Swift %t/File.swift -emit-module -emit-module-path %t/Logging.swiftmodule | %FileCheck %s -check-prefix CHECK-STDLIB
// CHECK-STDLIB: package name "Swift" is reserved for the standard library

// RUN: %target-swift-frontend -module-name Logging -package-name Logging %t/File.swift -emit-module -emit-module-path %t/Logging.swiftmodule | %FileCheck %s -check-prefix CHECK-DUPE
// CHECK-DUPE: package name "Logging" should be different from the module name

// BEGIN File.swift
public func log(level: Int) {}

