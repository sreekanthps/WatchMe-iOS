//
//  SplashViewTests.swift
//  WatchMeTests
//
//  Created by Sreekanth on 26/2/21.
//

import UIKit
import XCTest
@testable import WatchMe

class SplashViewTests: XCTestCase {
    
    class MockActionDelegate: ActionDelegate {
        var isActionSenderCalled: Bool = false

        func actionSender(didReceiveAction action: DelegateAction) {
            isActionSenderCalled = true
        }
    }
    
    var view: SplashView!
    var delegate: MockActionDelegate!
    override func setUpWithError() throws {
        super.setUp()
        view = SplashView()
        delegate = MockActionDelegate()
        view.delegate = delegate
       
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
       
        super.tearDown()
    }
    func testInitCoder() {
        //Arrange
        let view = SplashView(coder: NSCoder())
        
        //Assert
        XCTAssertNil(view)
    }
    func testPrimaryButtonTappedShouldDelegateMessage() {
        // Act
        view.startLoadAnimation()
        //Assert
        XCTAssertFalse(delegate.isActionSenderCalled)
    }
    func testStartloadAnimation() {
        // Act
        view.startLoadAnimation()
        //Assert
        XCTAssertNotNil(view.lottieView)
    }
    func testconfigure() {
        // Act
        view.configure()
        //Assert
        XCTAssertNotNil(view.lottieView)
    }
    
    func testLoadView(){
        // Act
        view.loadView()
        //Assert
        XCTAssertNotNil(view.root.superview)
        XCTAssertNotNil(view.root.subviews)
        XCTAssertGreaterThan(view.root.subviews.count, 0)
    }
    
    func testlayoutSubviews() {
        // Act
        view.layoutSubviews()
        // Assert
       
    }
}
