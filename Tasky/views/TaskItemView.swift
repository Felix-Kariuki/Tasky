//
//  TaskItemView.swift
//  Tasky
//
//  Created by Felix kariuki on 18/02/2024.
//

import SwiftUI

struct TaskItemView: View {
    
    @Bindable var task: TaskyItem
    
    var onClick:() -> Void
    
    var body: some View {
        VStack(alignment: .leading) {
            
            Text(task.title)
                .font(.system(size: 18))
                .fontWeight(.medium)
            
            Spacer()
            
            Text(task.taskyDesc)
                .font(.system(size: 15))
            
                .lineLimit(2)
            
            Spacer()
            HStack{
                
                Text("\(task.timeStamp,format: Date.FormatStyle(date: .numeric,time: .none))")
                    .foregroundColor(.gray)
                    .font(.system(size: 11))
                
                Spacer()
                
                Button {
                    withAnimation {
                        task.isDone.toggle()
                    }
                } label: {
                    
                    Image(systemName: "checkmark")
                        .symbolVariant(.circle.fill)
                        .foregroundStyle(task.isDone ? .green : .gray)
                        .font(.system(size: 15))
                }
                .buttonStyle(.plain)
                
                
            }
        }
        .onTapGesture {
            onClick()
        }
    }
    
}
