// https://github.com/Quick/Quick

import Quick
import Nimble
import RxMatrixSDK

class MXUserSpec: QuickSpec {
    override func spec() {
        describe("these will test initial status") {

            it("should be NOT_LOGGED") {
                let expected = UserAuthenticationStatus.NOT_LOGGED
                expect(expected) == MXUser.currentUser.status
            }
            
        }
        describe("these will login and check the status") {

            let expectation = self.expectation(description: "expectation")
            it("should be able to login and change the status") {
                MXUser.authenticate(credential: MXCredential(homeserver:"matrix.org",username:"rxmatrix"), password: "password", { (error) in
                    XCTAssertNil(error)
                    let expected = UserAuthenticationStatus.LOGGED
                    expect(expected) == MXUser.currentUser.status
                    expectation.fulfill()
                })

                self.waitForExpectations(timeout: 10, handler: { (error) in
                    XCTAssertNil(error)
                })

            }


        }
    }
}
