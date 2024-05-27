//
//  TaskMenuView.swift
//  Rooted
//
//  Created by Christopher Woods on 4/18/24.
//

import SwiftUI

struct TaskMenuView: View {
    @State var isPresented = false
    @State var isShowingDetail = false
    @State var currentTask: Task
    @EnvironmentObject var user: User
    var body: some View {
        ZStack(){
            
            Color(.backgroundBrown).ignoresSafeArea()
            VStack{
                Text("Today's Goals")
                    .font(Font.custom("OriyaSangamMN-Bold", size: 30))
                    .font(.title)
                    .underline()
                    .foregroundStyle(Color("fontColor"))
                    .padding()
                
                ScrollView{
                    ForEach(user.myTasks, id:  \.self){
                        task in
                        Button(action: {
                            isShowingDetail.toggle()
                            currentTask = task
                        }) {
                            VStack{
                                HStack{
                                    Spacer()
                                    Text(task.name)
                                        .font(Font.custom("OriyaSangamMN-Bold", size: 30))
                                        .font(.system(size: 25))
                                        .underline()
                                        .bold()
                                        .foregroundStyle(Color("fontColor"))
                                        .lineLimit(1)
                                        .padding(.bottom, 2)
                                        
                                    Spacer()
                                }
                                .padding(.top, 5)
                                Text(task.bio)
                                    .font(.system(size: 23))
                                    .foregroundStyle(Color("fontColor"))
                                    .lineLimit(2)
                                    .multilineTextAlignment(.center)
                                    .frame(maxWidth: 200)
                                Spacer()
                            }
                            .background(Color.taskBackground)
                          
                            .overlay(alignment: .leading){
                                Circle()
                                    .stroke(getColorForType(task.type), lineWidth: 5)
                                    .fill(getFillForType(task.type))
                                    .frame(width: 40)
                                    .padding(.horizontal, 10)
                                    .padding(.top, 15)
                            }
                            
                        }
                        Divider()
                        Spacer()
                        }
                        
                }.padding(.bottom, 15)
                
                
                    
                
                
                
            }
            if isShowingDetail{
                TaskDetailView(isShowing: $isShowingDetail, myTask: currentTask).environmentObject(user)
            }
            VStack {
               Spacer()
               HStack {
                   Spacer()
                   AddTaskButton()
                       .onTapGesture {
                           isPresented.toggle()
                       }
               }
           }
            }.ignoresSafeArea(edges: .bottom).sheet(isPresented: $isPresented, content: {TaskEditView(isPresented: $isPresented).environmentObject(user)})
            
        
    }
        
}
func getColorForType(_ type: Int) -> Color {
    switch type {
    case 0:
        return Color.red
    case 1:
        return Color.blue
    case 2:
        return Color.green
    default:
        return Color.gray // or any other default color
    }
}
func getFillForType(_ type: Int) -> Color {
    switch type {
    case 0:
        return Color.redFill
    case 1:
        return Color.blueFill
    case 2:
        return Color.greenFill
    default:
        return Color.gray // or any other default color
    }
}
//#Preview {
//    TaskMenuView()
//}


