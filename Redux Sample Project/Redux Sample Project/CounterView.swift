//
//  ContentView.swift
//  Redux Sample Project
//
//  Created by sardar saqib on 31/01/2026.
//

import SwiftUI

struct CounterView: View {

    @EnvironmentObject var store: Store

    var body: some View {
        let props = map(state: store.state)
        VStack {
            Text("Counter value: \(props.counter)")
                .font(.system(size: 20))
                .foregroundStyle(.primary)
                .fontWeight(.bold)

            VStack {
                Button {
                    props.onIncrement()
                } label: {
                    Label("Increment", systemImage: "plus")
                        .font(.system(size: 20))
                        .foregroundStyle(.primary)
                        .fontWeight(.bold)
                }
                .buttonStyle(.borderedProminent)

                Button {
                    props.onDecrement()
                } label: {
                    Label("Decrement", systemImage: "minus")
                        .font(.system(size: 20))
                        .foregroundStyle(.primary)
                        .fontWeight(.bold)
                }
                .buttonStyle(.borderedProminent)

            }
        }
        .padding()
    }
}

#Preview {
    CounterView()
}

extension CounterView {
    struct Props {
        let counter: Int
        let onIncrement: () -> Void
        let onDecrement: () -> Void
    }

    private func map(state: CounterState) -> Props {
        return Props(
            counter: state.counter,
            onIncrement: {
                store.dispatch(action: IncrementAction())
            },
            onDecrement: {
                store.dispatch(action: DecrementAction())
            }
        )
    }
}
