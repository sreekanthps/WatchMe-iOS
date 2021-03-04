//
//  SplashViewControlleTest.swift
//  WatchMeTests
//
//  Created by  Sreekanth on 26/2/21.
//

import XCTest
@testable import WatchMe


class SplashViewControllerTest: XCTestCase {
    
    class MockActionDelegate: ActionDelegate {
        func actionSender(didReceiveAction action: DelegateAction) {
            
        }
    }
    
    var splashVC: SplashViewController?
    var mockDelegate: MockActionDelegate!
    override func setUpWithError() throws {
        super.setUp()
        splashVC = SplashViewController()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        self.splashVC?.viewWillDisappear(false)
        self.splashVC?.viewDidDisappear(false)
        super.tearDown()
    }
    func testLoadAnimation() throws {
        splashVC?.startAnimation()
    }
    
    func testViewmethods() throws {
        splashVC?.viewDidLoad()
    }
    
    func testNavigation() throws {
        //Act
        splashVC?.navigationController?.setNavigationBarHidden(true, animated: true)
        
        XCTAssertNil(splashVC?.navigationController?.navigationBar.isHidden)
        let statubar = splashVC?.navigationController?.navigationBar.isHidden ?? true
        //Assert
        XCTAssertTrue(statubar)
    }
    func testInitCoder() {
        let vc = SplashViewController(coder: NSCoder())
        XCTAssertNil(vc)
    }
    func testnavigateToDashBoard() {
        //Arrange
        let vc = HomeRouter.createModule()
        //Act
        splashVC?.navigateToDashBoard()
        //Assert
        XCTAssertNotEqual(vc, splashVC?.navigationController?.topViewController)
    }
    
    
}
