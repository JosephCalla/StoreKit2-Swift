//
//  StoreKit2_SwiftUI_SwiftUITestsLaunchTests.swift
//  StoreKit2-SwiftUI-SwiftUITests
//
//  Created by Joseph Estanislao Calla Moreyra on 28/11/22.
//

import XCTest

final class StoreKit2_SwiftUI_SwiftUITestsLaunchTests: XCTestCase {

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()

        // Insert steps here to perform after app launch but before taking a screenshot,
        // such as logging into a test account or navigating somewhere in the app

        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}
