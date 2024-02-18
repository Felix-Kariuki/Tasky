//
//  ContentView.swift
//  Tasky
//
//  Created by Felix kariuki on 18/02/2024.
//

import SwiftUI
import SwiftData

struct TasksListView: View {
    
    @State private var createBottomSheet =  false
    @State private var taskEdit: TaskyItem?
    
    @Environment(\.modelContext) var context
    
    @Query private var tasks: [TaskyItem]
    
    var body: some View {
        NavigationStack{
            ScrollView {
                VStack(alignment: .leading)  {
                    ForEach(tasks){ task in
                        TaskItemView(task:task,onClick: {
                            taskEdit = task
                        })
                              
                        Spacer().frame(height:20)

                        }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .padding()
            
            
                .toolbar {
                    ToolbarItem(placement: .navigation) {
                        Text("Your Tasks")
                            .font(.system(size: 24))
                            .fontWeight(.medium)
                        
                            
                    }
                    ToolbarItem {
                        Spacer()
                    }
                    
                    ToolbarItem(placement: .primaryAction) {
                        Button(action: {
                            createBottomSheet.toggle()
                        
                        }, label: {
                            Image(systemName: "plus")
                                .font(Font.system(size: 22))
                                .foregroundColor(.black)
                                          
            
                        })
                        .tint(.black)
                        
                       }
                }
                .sheet(isPresented: $createBottomSheet){
                    NavigationStack{
                        CreateTaskBottomView()
                    }
                    .presentationDetents([.large])
                }
                .sheet(item: $taskEdit){
                    taskEdit = nil
                } content: { task in
                    EditTaskItem(task: task)
                
                }
        }
    }
    
    
}


#Preview {
    TasksListView()
}
