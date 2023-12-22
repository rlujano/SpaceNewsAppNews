@testable import News
@testable import CoreApp

class ArticlesViewModelDelegateSpy: ArticlesViewModelDelegateProtocol {

    public var currentState: Int = -1
    func articlesEvent(state: CoreApp.ViewControllerState) {
        currentState = 
    }
}
