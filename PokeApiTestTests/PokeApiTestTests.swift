//
//  PokeApiTestTests.swift
//  PokeApiTestTests
//
//  Created by mac on 11/14/20.
//

import XCTest
@testable import PokeApiTest

class PokeApiTestTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

  func testShouldReturnPokemonNumber() throws {


    let StringUtils = StringOperations()
    assert(StringUtils.GetPokemonNumber(urlDataAsString: "https://pokeapi.co/api/v2/pokemon/3/") == "3")
    assert(StringUtils.GetPokemonNumber(urlDataAsString: "https://pokeapi.co/api/v2/pokemon/19/") == "19")
    assert(StringUtils.GetPokemonNumber(urlDataAsString: "https://pokeapi.co/api/v2/pokemon/1009/") == "1009")


  }

}
