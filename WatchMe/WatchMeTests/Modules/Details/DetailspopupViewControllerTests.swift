//
//  DetailspopupViewControllerTests.swift
//  WatchMeTests
//
//  Created by Sreekanth on 26/2/21.
//

import XCTest
@testable import WatchMe
class DetailspopupViewControllerTests: XCTestCase {
    
    
    var detailsVC: DetailspopupViewController?
    override func setUpWithError() throws {
        super.setUp()
        detailsVC = DetailspopupViewController(details: CameraInfoFactory.getCamerainfo_oneData(date: Date()))
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        self.detailsVC?.viewWillDisappear(false)
        self.detailsVC?.viewDidDisappear(false)
        super.tearDown()
    }
    func testLoadAnimation() throws {
        
    }
    
    func testViewmethods() throws {
        detailsVC?.viewDidLoad()
        XCTAssertNil(self.detailsVC?.cameraDetails)
        XCTAssertNotEqual(self.detailsVC?.view.backgroundColor, UIColor.white)
    }
    
    func testNavigation() throws {
        //Act
        //detailsVC?.navigationController?.setNavigationBarHidden(true, animated: true)
        
        XCTAssertNil(detailsVC?.navigationController?.navigationBar.isHidden)
        let statubar = detailsVC?.navigationController?.navigationBar.isHidden ?? true
        //Assert
        XCTAssertTrue(statubar)
    }
    func testInitCoder() {
        let view = DetailspopupViewController(coder: NSCoder())
        XCTAssertNil(view)
    }
    
    func testloadView(){
        // Arrange
         let view = DetailspopupView(label: "XCtest Data", image: "XCtest Image")
        
        // Act
        detailsVC?.loadView()
        
        //Assert
        XCTAssertNotEqual(detailsVC?.view, view)
        XCTAssertNotNil(detailsVC?.mainView)
        
    }
    
}
