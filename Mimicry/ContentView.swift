//
//  ContentView.swift
//  Mimicry
//
//  Created by Irina Deeva on 19/12/24.
//

import SwiftUI

struct ContentView: View {
  @Namespace private var animationNamespace
  @State private var expand = false

  var body: some View {
    if expand {

      ZStack(alignment: .center) {
        RoundedRectangle(cornerRadius: 30.0)
          .matchedGeometryEffect(id: "shape", in: animationNamespace)
          .foregroundColor(Color.blue)
          .frame(width: 380, height: 300)

        VStack(alignment: .center) {
          HStack {
            Button(action: {
              withAnimation {
                expand.toggle()
              }
            }) {
              HStack {
                Image(systemName: "arrowshape.backward.fill")
                Text("Back")
              }
              .matchedGeometryEffect(id: "text", in: animationNamespace)
              .font(.headline)
              .foregroundColor(.white)
              .bold()
              .padding()
            }

            Spacer()
          }

          Spacer()
        }
        .padding()

      }
      .frame(minWidth: 0, maxWidth: .infinity, maxHeight: 300)
    } else {
      VStack {
        Spacer()

        HStack {
          Spacer()

          Button(action: {
            withAnimation {
              expand.toggle()
            }
          }) {
            RoundedRectangle(cornerRadius: 15.0)
              .matchedGeometryEffect(id: "shape", in: animationNamespace)
              .foregroundColor(Color.blue)
              .frame(width: 100, height: 50)
              .overlay(
                HStack {
                  Text("Open")
                    .padding()
                }
                  .matchedGeometryEffect(id: "text", in: animationNamespace, properties: .position, anchor: .leading)
                  .font(.headline)
                  .foregroundColor(.white)
              )
          }
        }
        .padding()
      }
    }
  }
}

#Preview {
  ContentView()
}
