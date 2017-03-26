// https://github.com/Quick/Quick

import Quick
import Nimble
import RxMatrixSDK

class MXUserSpec: QuickSpec {
    override func spec() {
        describe("these will login and check the status") {

            let expectation = self.expectation(description: "expectation")
            it("should be able to login and change the status") {
                MXUser.authenticate(credential: MXCredential(homeserver:"https://matrix.org",username:"rxmatrix"), password: "", { (error) in
                    XCTAssertNil(error)
                    it("should be LOGGED") {
                        let expected = UserAuthenticationStatus.LOGGED
                        expect(expected) == MXUser.currentUser.status
                    }
                    expectation.fulfill()
                })

                self.waitForExpectations(timeout: 10, handler: { (error) in
                    XCTAssertNil(error)
                })

            }


        }
    }
}
