//
//  CounterStore.swift
//  Redux Sample Project
//
//  Created by sardar saqib on 31/01/2026.
//

import Combine
import Foundation

typealias CounterReducer = (_ state: CounterState, _ action: Action) ->
    CounterState

struct CounterState {
    var counter: Int
}

protocol Action {}

struct IncrementAction: Action {}
struct DecrementAction: Action {}

func counterReducer(state: CounterState, action: Action) -> CounterState {
    var mutatingState = state
    switch action {
    case _ as IncrementAction:
        mutatingState.counter += 1
    case _ as DecrementAction:
        guard state.counter > 0 else { return state }
        mutatingState.counter -= 1
    default:
        break
    }
    return mutatingState
}

class Store: ObservableObject {
    @Published var state: CounterState
    var reducer: CounterReducer

    init(state: CounterState, reducer: @escaping CounterReducer) {
        self.state = state
        self.reducer = reducer
    }

    func dispatch(action: Action) {
        self.state = counterReducer(state: state, action: action)
    }
}
