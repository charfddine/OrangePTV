//
//  ListProgrammeUc.swift
//  OrangePTVTests
//
//  Created by Charfeddine Ilahi on 06/12/2021.
//
import XCTest
import Combine
@testable import OrangePTV

class ListProgrammeUc: XCTestCase {
    private var listProgrammesVM : ListProgrammesVM!
    private var programmeServiceMock : ProgrammeServicesMock!

    override class func setUp() {
        super.setUp()
    }
    
    
    func testListProgrammes(){

        listProgrammesVM = ListProgrammesVM(programmeService: ProgrammeServicesMock())
        let programmeServiceMock = ProgrammeServicesMock()
        var programmes = [ProgrammeModel]()
        var error: Error?
        let expectation = self.expectation(description: "Listing")
        
        programmeServiceMock.getData(urlString: "game").sink(receiveCompletion: { completion in
            switch completion {
            case .finished:
                break
            case .failure(let encounteredError):
                error = encounteredError
            }
            expectation.fulfill()
        }, receiveValue: {
            (value : ListProgrammesModel)  in
            programmes = value.contents ?? []
        })
        // .store(in: &cancellables)
        
        // Awaiting fulfilment of our expecation before
        // performing our asserts:
        waitForExpectations(timeout: 10)
        // Asserting that our Combine pipeline yielded the
        // correct output:
        XCTAssertNil(error)
        XCTAssertEqual(programmes.count, 3)
    }
    
}
