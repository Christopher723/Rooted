//
//  AddTaskButton.swift
//  Rooted
//
//  Created by Christopher Woods on 5/1/24.
//

import SwiftUI

struct AddTaskButton: View {
    var body: some View {
        ZStack{
            Image(systemName: "plus")
                .font(.title.weight(.semibold))
                .padding()
                .background(.button)
                .foregroundColor(.white)
                .clipShape(Circle())
                .shadow(radius: 4, x: 0, y: 4).padding(25)
        }
    }
}

#Preview {
    AddTaskButton()
}
