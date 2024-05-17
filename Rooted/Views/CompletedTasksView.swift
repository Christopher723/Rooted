//
//  TaskDetailView.swift
//  Rooted
//
//  Created by Christopher Woods on 4/30/24.
//

import SwiftUI

struct CompletedTasksView: View {
    @Binding var isShowing: Bool
    @EnvironmentObject var user: User
    var whatTasks: [Task]
    var body: some View {
        ZStack{
            
                ScrollView{
                    Spacer().frame(height: 50)
                    ForEach(whatTasks, id:  \.self){
                        task in
                        TaskView(isExpanded: false, myName: task.name, myBio: task.bio, myColor: getColorForType(task.type),myBackground: getFillForType(task.type))
                        
                    }

                }.frame(width: 340, height: 655)
                    .background(Color(.systemBackground))
                    .cornerRadius(12)
                    .shadow(radius: 40)
                    .overlay(Button{
                        isShowing = false
                    }label:{
                        XDismissButton()
                    }, alignment: .topTrailing)
                    
                }
                
                
            
            
        

    }
        
}

//#Preview{
//    CompletedTasksView(isShowing: .constant(true), whatTasks: <#[Task]#>).environmentObject(User())
//}
