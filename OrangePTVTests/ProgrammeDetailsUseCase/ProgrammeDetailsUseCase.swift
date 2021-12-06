//
//  ProgrammeDetailsUseCase.swift
//  OrangePTVTests
//
//  Created by Charfeddine Ilahi on 06/12/2021.
//

import XCTest
import Combine
@testable import OrangePTV

class ProgrammeDetailsVMSpec: XCTestCase {
    private var programmeDetailsVM : ProgrammeDetailsVM!
    private var programmeServiceMock : ProgrammeServicesMock!
    
    override class func setUp() {
        super.setUp()
    }
    
    func testGetProgrammeDetails(){

        let programmeServiceMock = ProgrammeServicesMock()
        programmeDetailsVM = ProgrammeDetailsVM(programmeService: programmeServiceMock)
        var pitch : String = ""
        var error: Error?
        let expectation = self.expectation(description: "Listing")
        
        let _ = programmeServiceMock.getPitch(detailLink: "detailLink")
                    .sink(receiveCompletion: { completion in
                        switch completion {
                        case .finished:
                            break
                        case .failure(let encounteredError):
                            error = encounteredError
                        }
                        // Fullfilling our expectation to unblock
                        // our test execution:
                        expectation.fulfill()
                    }, receiveValue: { value in
                        pitch = value
                    })
                    //.store(in: &cancellables)
        
        // Awaiting fulfilment of our expecation before
        // performing our asserts:
        waitForExpectations(timeout: 10)
        // Asserting that our Combine pipeline yielded the
        // correct output:
        XCTAssertNil(error)
        XCTAssertEqual(pitch, "This my pitch")
        
    }

}

