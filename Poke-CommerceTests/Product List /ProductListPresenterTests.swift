//
//  ProductListPresenterTests.swift
//  Poke-CommerceTests
//
//  Created by Lucas M Soares on 02/07/21.
//

import XCTest
@testable import Poke_Commerce

class ProductListPresenterTests: XCTestCase {

    var presenter: ProductListPresenter!
    let view = ProductListView()
    let service = MockProductListService()
    
    override func setUp() {
        self.presenter = .init(view: self.view, service: self.service)
    }
    
    func testRequestProductsSuccess() {
        self.service.requestResult = .success(viewItems: self.service.mockCategories)
        self.presenter.requestProducts()
        
        XCTAssertNil(self.presenter.requestError)
    }
    
    func testRequestProductsFailed() {
        self.service.requestResult = .fail(error: "test error")
        self.presenter.requestProducts()
        
        XCTAssertNotNil(self.presenter.requestError)
    }
    
    func testSectionsCountIsMoreThanZero() {
        self.service.requestResult = .success(viewItems: self.service.mockCategories)
        self.presenter.requestProducts()
        
        XCTAssertTrue(self.presenter.sectionsCount() > 0)
    }
    
    func testSectionHasItem() {
        self.service.requestResult = .success(viewItems: self.service.mockCategories)
        self.presenter.requestProducts()
        
        XCTAssertNotNil(self.presenter.sectionItem(by: 0))
    }
    
    func testItemSelectedSuccess() {
        self.service.requestResult = .success(viewItems: self.service.mockCategories)
        self.presenter.requestProducts()
        self.presenter.itemSelected(section: 0, row: 0)
        
        XCTAssertNotNil(self.presenter.getProductDetailSelected())
    }
    
    func testGetProductDetailSelectedSuccess() {
        self.service.requestResult = .success(viewItems: self.service.mockCategories)
        self.presenter.requestProducts()
        self.presenter.itemSelected(section: 0, row: 0)
        
        XCTAssertNotNil(self.presenter.getProductDetailSelected())
    }
    
    func testGetProductDetailSelectedFail() {
        self.service.requestResult = .success(viewItems: self.service.mockCategories)
        self.presenter.requestProducts()
        
        XCTAssertNil(self.presenter.getProductDetailSelected())
    }
}


