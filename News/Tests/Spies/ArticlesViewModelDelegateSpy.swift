@testable import News

class ArticlesViewModelDelegateSpy: ArticlesViewModelDelegateProtocol {   
    public var currentState: Int = -1
    func articlesEvent(state: Int) {
        currentState = state
    }
}
