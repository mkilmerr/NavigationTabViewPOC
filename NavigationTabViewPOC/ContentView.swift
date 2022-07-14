//
//  ContentView.swift
//  NavigationTabViewPOC
//
//  Created by Marcos Kilmer Pereira de Aquino on 13/07/22.
//

import SwiftUI

struct ContentView: View {
    let pageOne: some View = ContainerIndicatorFactory.create(indicator: 1)
    let pageTwo: some View = ContainerIndicatorFactory.create(indicator: 2)

    var body: some View {
        NavigationView {
            TabView {
                pageOne
                pageTwo
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
        }

    }
}

struct ContainerThatWillBePush: View {
    var body: some View {
        Text("Hello")
    }
}

struct ContainerIndicatorFactory {
    static func create(indicator: Int) -> some View {
        return VStack {
            ZStack {
                Rectangle()
                    .fill(Color.red)
                    .frame(width: 200, height: 200, alignment: .center)
                    .cornerRadius(12)

                Text("\(indicator)")
                    .bold()
                    .foregroundColor(.white)
                    .font(.system(size: 30))
            }

            NavigationLink(destination: ContainerThatWillBePush()) {
                Text("go to third")
                    .bold()
                    .foregroundColor(Color.black)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
            ContentView()
        }
    }
}
