//  RxViewModel.swift
//  
//
//  Created by blakerogers on 3/21/19.
//

import Foundation
import RxSwift
import RxCocoa
public protocol RxOutputsViewState {
    associatedtype ViewStateType
    var viewState: BehaviorRelay<ViewStateType?> { get set}
}
public protocol RxViewModelType: MVIViewModelType {
    associatedtype IntentType
    associatedtype ViewStateType
    var intent: PublishSubject<IntentType?> { get set}
    var result: PublishSubject<Result> { get set}
    func reduce(accumViewState: ViewStateType?, result: Reducing) -> ViewStateType?
}
public class RxViewModel<VS: ViewState, I: Intent>: OutputsViewState, ViewModelType {
    private let bag = DisposeBag()
    public typealias ViewStateType = VS
    public typealias Route = (RoutedIntent?, ViewStateType) -> Void
    public typealias ServiceHandler = (ServiceIntent?, ViewStateType) -> Void
    public typealias DelegateHandler = (DelegateIntent?, ViewStateType) -> Void
    public var intent: PublishSubject<I?> = Box(nil)
    public var viewState: BehaviorRelay<ViewStateType?> = BehaviorRelay(value: nil)
    public var result = PublishSubject<Result>() //= PublishSubject(EmptyResult.notSet)
    public var coordinator: CoordinatorType?
    public var delegate: Delegate?
    public var service: MVIService?
    public var route: Route?
    public var serviceHandler: ServiceHandler?
    public var delegateHandler: DelegateHandler?
    public init(coordinator: CoordinatorType? = nil, delegate: Delegate? = nil, service: MVIService? = nil, route: Route?, serviceHandler: ServiceHandler? = nil, delegateHandler: DelegateHandler? = nil, initial: IntentType? = nil) {
        self.coordinator = coordinator
        self.delegate = delegate
        self.service = service
        self.route = route
        self.serviceHandler = serviceHandler
        self.delegateHandler = delegateHandler
        configure()
        self.intent.onNext(initial)
    }
}
extension RxViewModel {
    /// Observe intents received from view
    internal func bindIntent() {
        intent.asDriver().drive(onNext: { intent,_ in
            guard let intent = intent as? ActionIntent else { return }
            self.result.onNext(intent.implementAction())
        }).diposed(by: bag)
        intent.asDriver().drive(onNExt: { [weak self] intent, _  in
            guard let intent = intent else { return }
            guard let this = self else { return }
            guard let state = this.viewState.element() else { return }
            self?.delegateHandler?(intent as? DelegateIntent, state )
            self?.route?(intent as? RoutedIntent, state)
            self?.serviceHandler?(intent as? ServiceIntent, state)
        }).diposed(by: bag)
        intent.asDriver().drive( onNext: { intent, _ in
            guard let intent = intent as? DelayedIntent else { return }
            self.result.onNext(intent.implement())
        }).diposed(by: bag)
    }
    /// Bind Results from Actions
    internal func bindResults() {
        result.asDriver().drive(onNext: { [weak self] result, _ in
            guard let this = self else { return }
            guard let result = result as? Reducing else { return}
            guard let newState = this.reduce(accumViewState: this.viewState.element(), result: result) else {return}
            this.viewState.accept(newState)
        }).diposed(by: bag)
    }
    internal func bindService() {
        service?.serviceResult.asDriver().drive(onNext: { result, _ in
            self.result.onNext(result)
        }).diposed(by: bag)
    }
    /// Provide an accumulated Viewstate from result changes
    ///
    /// - Parameters:
    ///   - accumViewState: ViewState
    ///   - result: Result
    /// - Returns: ViewState
    public func reduce(accumViewState: ViewStateType?, result: Reducing) -> ViewStateType? {
//        return result.reduce(accumViewState: accumViewState) as? ViewStateType
        return accumViewState
    }
}
