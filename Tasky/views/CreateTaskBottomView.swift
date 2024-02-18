//
//  CreateTaskBottomView.swift
//  Tasky
//
//  Created by Felix kariuki on 18/02/2024.
//

import SwiftUI
import SwiftData

struct CreateTaskBottomView: View {
    
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) var context
    
    @State private var task = TaskyItem()
    
    var body: some View {
        VStack(alignment: .leading) {
                Text("Title")
                .fontWeight(.medium)
                .font(.system(size: 18))
            
            Spacer().frame(height: 10)
            
            TextField("Enter the task title", text: $task.title)
                .font(.system(size: 16))
                .padding(.horizontal, 8)
                .background(Color.white)
                .padding(.vertical, 16)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.gray, lineWidth: 0.2)
                )
       
                             
                            
            Spacer().frame(height: 30)
            

            
            Text("Description")
            .fontWeight(.medium)
            .font(.system(size: 18))
                    
                    TextEditor(text: $task.taskyDesc)
                        .frame(height: 120)
                        .multilineTextAlignment(.leading)
                        .padding(8)
                        .background(Color.white)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.gray, lineWidth: 0.5)
                        )
                        .cornerRadius(8)
              
        
        
            Spacer().frame(height: 30)
            
            Text("Date")
            .fontWeight(.medium)
            .font(.system(size: 18))
            
            DatePicker("Choose a date", selection: $task.timeStamp)
                .datePickerStyle(WheelDatePickerStyle())
                .labelsHidden()
                
            
            Spacer().frame(height: 50)
            
            Button{
                
                withAnimation {
                    context.insert(task)
                }
                
                       dismiss()
                
                   } label: {
                       Text("Create Task")
                           .foregroundColor(.white)
                           .font(.system(size: 16, weight: .semibold))
                           .frame(maxWidth: .infinity, minHeight: 52)
                           .background(.black)
                           .cornerRadius(15)
                   }
            
            Spacer()
            
            
                }.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            .padding()
            
 
    }
}

