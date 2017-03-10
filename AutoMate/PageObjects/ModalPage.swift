//
//  ModalPage.swift
//  AutoMate
//
//  Created by Bartosz Janda on 31.01.2017.
//  Copyright © 2017 PGS Software. All rights reserved.
//

import Foundation
import XCTest

// MARK: - ModalPage protocol
/// Page object protocol describing behaviour of modally presented view.
/// Default implementation use "close" `accessibilityIdentifier`.
///
/// Example usage:
/// ```swift
/// class AboutTheAppView: BaseAppPage, ModalPage {}
///
/// let aboutTheAppView = AboutTheAppView(view: containerView)
/// aboutTheAppView.closeModalPage()
/// ```
///
/// - requires:
/// It is required to use "close" as `accessibilityIdentifier` in custom close button in the application to work with default implementation of this protocol.
public protocol ModalPage: BaseAppPageProtocol {

    // MARK: Elements
    /// Close button element.
    var closeButton: XCUIElement { get }

    // MARK: Actions
    /// Close modal view action.
    func closeModalPage()
}

// MARK: Default implementation
/// Default implementation of the `ModalPage` protocol.
public extension ModalPage {

    // MARK: Elements
    public var closeButton: XCUIElement {
        return view.buttons[Locators.closeModalButton]
    }

    // MARK: Actions
    public func closeModalPage() {
        closeButton.tap()
    }
}

// MARK: - Locators
private enum Locators: String, Locator {
    case closeModalButton = "close"
}