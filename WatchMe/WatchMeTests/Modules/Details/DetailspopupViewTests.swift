//
//  DetailspopupViewTests.swift
//  WatchMeTests
//
//  Created by Sreekanth on 26/2/21.
//

import UIKit
import XCTest
@testable import WatchMe

class DetailspopupViewTests: XCTestCase {
    
    class MockActionDelegate: ActionDelegate {
        var isActionSenderCalled: Bool = false

        func actionSender(didReceiveAction action: DelegateAction) {
            isActionSenderCalled = true
        }
    }
    
    var view: DetailspopupView!
    var delegate: MockActionDelegate!
    override func setUpWithError() throws {
        super.setUp()
        view = DetailspopupView(label: "XCT Test", image: "XCT Image")
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
        let view = DetailspopupView(coder: NSCoder())
        
        //Assert
        XCTAssertNil(view)
    }
    func testPrimaryButtonTappedShouldDelegateMessage() {
        // Act
        
        //Assert
        XCTAssertFalse(delegate.isActionSenderCalled)
    }
    
    func testconfigure() {
        // Act
        view.configure()
        //Assert
        XCTAssertNotNil(view.title)
        XCTAssertNotNil(view.imagePath)
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
    
    func testComputedProperties() {
        //Assert
        XCTAssertEqual(view.headerView.backgroundColor,UIColor.hexColor(Colors.hd1))
        XCTAssertNotNil(view.closebutton)
        XCTAssertNotEqual(view.root.backgroundColor,UIColor.white)
    }
    func testButtonPressed(){
        
        //Act
        view.buttonPressed(UIButton())
        
        //Assert
        XCTAssertTrue(delegate.isActionSenderCalled)
    }
    
    func testdismissAction(){
        
        //Act
        view.dismissAction(UITapGestureRecognizer())
        
        //Assert
        XCTAssertTrue(delegate.isActionSenderCalled)
    }
}
