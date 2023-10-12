//
//  Pleny_TaskTests.swift
//  Pleny-TaskTests
//
//  Created by Mohamad Basuony on 17/09/2023.
//

import XCTest
import Combine
@testable import Pleny_Task

final class Pleny_TaskTests: XCTestCase {

    var subscriptions = Set<AnyCancellable>()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testLoginEmail(){
        let service = AuthRepositoryImplementation()

        // Initialize SignIn View Model
        let repo = AuthRepositoryImplementation()
        let coordinator = LoginCoordinator()
        let viewModel: LoginViewModel = LoginViewModel(model: LoginModel(), repository: repo,coordinator: coordinator)
        let emailPublisher = viewModel.nameValidation
        let expectation = XCTestExpectation(description: "Valid Email")

        emailPublisher.sink { validation in
            XCTAssertTrue(validation.isValid)
            expectation.fulfill()
        }.store(in: &subscriptions)
        
        viewModel.model.username = "name"
        wait(for: [expectation], timeout: 1)
    }
    
    func testLoginPassword(){
        let repo = AuthRepositoryImplementation()
        let coordinator = LoginCoordinator()
        let viewModel: LoginViewModel = LoginViewModel(model: LoginModel(), repository: repo,coordinator: coordinator)
        let passwordPublisher = viewModel.passwordValidation
        let expectation = XCTestExpectation(description: "Valid Password")
        
        passwordPublisher.sink { validation in
            XCTAssertTrue(validation.isValid)
            expectation.fulfill()
        }.store(in: &subscriptions)

        viewModel.model.password = "12345678"
        wait(for: [expectation], timeout: 1)
    }


}
