//
//  TaskDetailView.swift
//  Rooted
//
//  Created by Christopher Woods on 4/30/24.
//

import SwiftUI

struct TaskDetailView: View {
    @Binding var isShowing: Bool
    @State var multiplier = 1
    @EnvironmentObject var user: User
    var myTask: Task
    var body: some View {
        ZStack{
            
            VStack{
                HStack{
                    Text(myTask.name)
                        .padding()
                        .bold()
                        .lineLimit(2)
                        .font(.system(size: 24))
                        .multilineTextAlignment(.center)
                }.padding()
                
                Text(myTask.bio)
                
                    .padding()
                
                Spacer()
                HStack(spacing: 20){
                    
                    Button(action: {UIImpactFeedbackGenerator(style: .medium).impactOccurred()
                        if let index = user.myTasks.firstIndex(where: { $0.id == myTask.id }) {
                            user.myTasks.remove(at: index)}
                        user.save()
                        isShowing.toggle()}, label: {
                            ZStack{
                                Rectangle()
                                    .frame(width: 120, height: 45)
                                    .foregroundStyle(.red)
                                Text("Delete")
                                    .foregroundStyle(.black)
                                    .bold()
                            }
                    })
                   
                   
                    
                    Button(action: {UIImpactFeedbackGenerator(style: .medium).impactOccurred()
                        user.completedTasksAmount += (1 * multiplier)
                        if let index = user.myTasks.firstIndex(where: { $0.id == myTask.id }) {
                            
                            user.completedTasks.append(myTask)
                            user.myTasks.remove(at: index)}
                        user.save()
                        isShowing.toggle()}, label: {
                            ZStack{
                                Rectangle()
                                    .frame(width: 120, height: 45)
                                    .foregroundStyle(.green)
                                Text("Complete")
                                    .bold()
                                    .foregroundStyle(.black)
                            }
                    })
                   
                    
                   
                }
                .padding()
            }
            .frame(width: 300, height: 405)
            .background(Color(.systemBackground))
            .cornerRadius(12)
            .shadow(radius: 40)
            .overlay(Button{
                isShowing = false
            }label:{
                XDismissButton()
            }, alignment: .topTrailing)
            
        }.onAppear{
            if user.completedPlants.count == 0{
                multiplier = 10
            }
            if user.completedPlants.count == 1{
                multiplier = 5
            }
            if user.completedPlants.count == 2{
                multiplier = 3
            }
            if user.completedPlants.count == 3{
                multiplier = 1
            }
            
        }

        

    }
        
}

//#Preview{
//    TaskDetailView(isShowing: .constant(true),
//                   myTask: Task(name: "Drink more water", bio:
//            "today is the day you go and drink more water do it today right now", type: 12))
//}
