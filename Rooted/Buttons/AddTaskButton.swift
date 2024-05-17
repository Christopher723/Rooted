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
            Circle()
                .foregroundStyle(.button)
                .frame(width: 50)
            Image(systemName: "plus")
                .resizable()
                .imageScale(.medium)
                .frame(width: 25,height: 25)
                .foregroundStyle(.white)
        }
    }
}

#Preview {
    AddTaskButton()
}
