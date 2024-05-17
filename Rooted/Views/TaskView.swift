//
//  TaskView.swift
//  Rooted
//
//  Created by Christopher Woods on 5/2/24.
//

import SwiftUI

struct TaskView: View {
    @State var isExpanded: Bool = false
    var myName: String = ""
    var myBio: String = ""
    var myColor: Color = .green
    var myBackground: Color = .green
    var body: some View {
        
        if isExpanded{
            VStack{
                HStack{
                    Spacer()
                    Text(myName)
                        .font(.system(size: 25))
                        .lineLimit(1)
                        .bold()
                        .underline()
                        
                        .foregroundStyle(Color("fontColor"))
                    Spacer()
                }
                .onTapGesture{
                    withAnimation(.snappy()) {
                    isExpanded.toggle()
                }
                }
                .frame(maxWidth: .infinity)
                .overlay(alignment: .leading){
                    Circle()
                        .stroke(myColor, lineWidth: 5)
                        .fill(myBackground)
                        .frame(width: 40)
                        .padding(.horizontal, 10)
                        
                }
                Text(myBio)
                    .padding(.horizontal, 10)
                    .font(.system(size: 20))
                    .foregroundStyle(Color("fontColor"))
                    .padding(.top, 5)
                Divider()
            }
        }
        else{
            HStack{
                Spacer()
                Text(myName)
                    .font(.system(size: 25))
                    .lineLimit(1)
                    .bold()
                    .underline()
                    .foregroundStyle(Color("fontColor"))
                Spacer()
            }
            .onTapGesture{
                withAnimation(.snappy()) {
                isExpanded.toggle()
            }
            }
            .frame(maxWidth: .infinity)
            .overlay(alignment: .leading){
                Circle()
                .stroke(myColor, lineWidth: 5)
                .fill(myBackground)
                .frame(width: 40)
                .padding(.horizontal, 10)
            }
            Divider()
        }
        
        
        
//        
//        VStack{
//            HStack{
//                Spacer()
//                Text(task.name)
//                    .font(.system(size: 25))
//                    .underline()
//                    .bold()
//                    .foregroundStyle(Color("fontColor"))
//                    .lineLimit(1)
//                    .padding(.bottom, 2)
//                    
//                Spacer()
//            }
//            .padding(.top, 5)
//            Text(task.bio)
//                .font(.system(size: 20))
//                .foregroundStyle(Color("fontColor"))
//                .lineLimit(2)
//                .multilineTextAlignment(.center)
//                .frame(maxWidth: 200)
//            Spacer()
//        }
//        .background(Color.taskBackground)
        
        
        
        
        
        
        
    }
}

