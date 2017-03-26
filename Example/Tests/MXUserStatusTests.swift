// https://github.com/Quick/Quick

import Quick
import Nimble
import RxMatrixSDK

class MXUserStatusSpec: QuickSpec {
    override func spec() {
        describe("these will test initial status") {

            it("should be NOT_LOGGED") {
                let expected = UserAuthenticationStatus.NOT_LOGGED
                expect(expected) == MXUser.currentUser.status
            }

        }
    }
}
