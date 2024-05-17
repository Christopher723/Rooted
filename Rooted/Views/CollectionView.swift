//
//  CollectionView.swift
//  Rooted
//
//  Created by Christopher Woods on 4/18/24.
//

import SwiftUI

struct CollectionView: View {
    @EnvironmentObject var user: User
    @State var plantTask: [Task] = []
    @State var isShowing: Bool = false
    let columns = [
        GridItem(.adaptive(minimum: 100))
    ]
    var body: some View {
        ZStack{
           
            Color(.backgroundBrown).ignoresSafeArea()
            ScrollView{
                ZStack{
                    VStack(spacing: 150){
                        Image("shelf")
                        Image("shelf")
                        Image("shelf")
                        Image("shelf")
                        Image("shelf")
                        Image("shelf")
                        Image("shelf")
                        Image("shelf")
                        Image("shelf")
                    }.padding(.top, 115)
                    
                    VStack{
                        HStack{
                            LazyVGrid(columns: columns, spacing:60){
                                ForEach(user.completedPlants, id:  \.self){ task in
                                    Image("plant9")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 75)
                                        .onTapGesture{
                                            plantTask = task
                                            isShowing = true
                                        }
                                }
                            }
                        }
                        Spacer()
                    }
                    
                    
                }
                
            }
            .padding()
            if isShowing{
                CompletedTasksView(isShowing: $isShowing, whatTasks: plantTask).environmentObject(User())
            }
        }
    }
}

//#Preview {
//    CollectionView()
//}
