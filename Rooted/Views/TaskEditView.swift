//
//  TaskEditView.swift
//  Rooted
//
//  Created by Christopher Woods on 4/18/24.
//

import SwiftUI

enum myTypes: String,CaseIterable, Identifiable {
    case physical, mental, spiritual, other
    var id: Self {self}
}


struct TaskEditView: View {
    @State var myName = ""
    @State var myBio = ""
    @State var myType = 0
    
    @State var selectedTypes: myTypes = .physical
    @Binding var isPresented: Bool
    @EnvironmentObject var user: User
    var body: some View {
        Form{
           
            Section(footer: Text("\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n")) {

                TextField("Enter Task Name", text: $myName)
                    .onChange(of: myName) {_, newText in
                       // Limit the text to a certain number of characters
                       if newText.count > 25 {
                           myName = String(newText.prefix(25))
                       }
                   }
                TextField("Enter Description", text: $myBio)
                
                
                
                Picker("Type", selection: $selectedTypes){
                    ForEach(myTypes.allCases) {
                        type in
                        Text(type.rawValue.capitalized)
                    }
                    
                }
                    
               }
            Section{
                Button(action: {
                    var mySuggestedTask = generateTask()
                    myName = mySuggestedTask.name
                    myBio = mySuggestedTask.bio
                    if mySuggestedTask.type == 1{
                        selectedTypes = .physical
                    }
                    else if mySuggestedTask.type == 2{
                        selectedTypes = .mental
                    }
                    else if mySuggestedTask.type == 3{
                        selectedTypes = .spiritual
                    }
                    else{
                        selectedTypes = .other
                    }
                    
                    
                },label: {
                    HStack {
                        Spacer()
                        Text("Suggested Goal")
                        Spacer()
                    }
                }).disabled(myName != "" || myBio != "")
            }

            Section{
                Button(action: {
                    switch selectedTypes {
                    case .physical:
                        myType = 0
                    case .mental:
                        myType = 1
                    case .spiritual:
                        myType = 2
                    case .other:
                        myType = 3
                    }
                    user.myTasks.append(Task(name: myName, bio: myBio, type: myType))
                    user.save()
                    isPresented.toggle()
                    
                },label: {
                    HStack {
                        Spacer()
                        Text("Submit")
                        Spacer()
                    }
                }).disabled(myName == "" || myBio == "")
                
            }
        }        
    }
}

func generateTask() -> Task{
    var myTask = taskList.randomElement()!
    return myTask
}

#Preview {
    TaskEditView(isPresented: .constant(true))
}

var taskList = [
    
    Task(name: "Go on a walk", bio: "Walk outside get some fresh air", type: 1),
    Task(name: "Meditate", bio: "Find somewhere peaceful and meditate for 15 minutes", type: 3),
    Task(name: "Read a book", bio: "Spend 30 minutes reading a book you've been meaning to read", type: 2),
    Task(name: "Cook a healthy meal", bio: "Plan and prepare a nutritious meal using fresh ingredients", type: 4),
    Task(name: "Practice gratitude", bio: "Take a moment to write down three things you're grateful for today", type: 3),
    Task(name: "Learn something new", bio: "Spend 20 minutes learning a new thing", type: 2),
    
    
    Task(name: "Exercise", bio: "Engage in physical activity for 30 minutes", type: 1),
    Task(name: "Hydration", bio: "Drink an adequate amount of water throughout the day.", type: 1),
    Task(name: "Balanced Nutrition", bio: "Consume a balanced diet rich in fruits, vegetables, whole grains, lean proteins, and healthy fats", type: 1),
    Task(name: "Adequate Sleep", bio: "Aim for 7-9 hours of quality sleep each night.", type: 1),
    Task(name: "Posture Improvement", bio: "Maintain good posture throughout the day to prevent back and neck pain.", type: 1),
    Task(name: "Cardiovascular Health", bio: "Engage in aerobic activities like swimming, cycling, dancing, or playing sports.", type: 1),
    Task(name: "Stress Management", bio: "Enjoy some hobbies that promote relaxation and enjoyment.", type: 2),
    Task(name: "Consistent Movement Breaks", bio: "Stand up, stretch, and move around every hour.", type: 1),
    Task(name: "Connection with Nature", bio: "Spend time in nature to appreciate the beauty of the natural world", type: 3),
    Task(name: "Reflection and Contemplation", bio: "Journal your thoughts and feelings, engage in quiet contemplation.", type: 3),
    Task(name: "Practice Compassion", bio: "Practice random acts of kindness, volunteer, offer support to those in need.", type: 2),
    Task(name: "Read Inspirational or Sacred Texts", bio: "Gain wisdom and inspiration from sacred or inspirational texts.", type: 3),
    Task(name: "Cultivate Forgiveness", bio: "Reflect on past grievances, practice forgiveness, and release negative emotions to foster inner peace.", type: 2),
    Task(name: "Align with Values", bio: "Reflect on your values, set intentions for living authentically.", type: 2)
    
    
    
//    Task(name: "", bio: "", type: 2)
    
    

]
