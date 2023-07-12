//
//  TaskRowView.swift
//  TaskManagementApp
//
//  Created by Bilal SIMSEK on 12.07.2023.
//

import SwiftUI

struct TaskRowView: View {
    
    @Bindable var task:Task
    
    @Environment (\.modelContext) private var context
    
    var indicatorColor:Color{
        if task.isCompleted{
            return .green
        }
        return task.creationDate.isSameHour ? .darkBlue :
        (task.creationDate.isPast ? .red : .black)
    }
    
    var body: some View {
        HStack(alignment:.top,spacing: 15){
            Circle()
                .fill(indicatorColor)
                .frame(width: 10,height: 10)
                .padding(4)
                .background(.white.shadow(.drop(color:.black.opacity(0.5),radius:3)),in:.circle)
                .overlay {
                    Circle()
                        .foregroundStyle(.clear)
                        .contentShape(.circle)
                        .frame(width: 50,height: 50)
                     //   .blendMode(.destinationOver)
                        .onTapGesture {
                            withAnimation {
                                task.isCompleted.toggle()
                            }
                        }
                }
            
            VStack(alignment:.leading,spacing: 8){
                Text(task.taskTitle)
                    .fontWeight(.semibold)
                    .foregroundStyle(.black)
                    
                
                Label(task.creationDate.format("hh:mm a"),systemImage: "clock")
                    .font(.caption)
                    .foregroundColor(.black)
            }
            .padding(15)
            .hSpacing(.leading)
            .background(task.tintColor,in:.rect(topLeadingRadius: 15, bottomLeadingRadius: 15))
            .strikethrough(task.isCompleted,pattern:.solid,color:.black)
            .contentShape(.contextMenuPreview,.rect(topLeadingRadius: 15, bottomLeadingRadius: 15))
            .contextMenu(ContextMenu(menuItems: {
                Button(role:.destructive) {
                    context.delete(task)
                    try? context.save()
                }label: {
                    Text("Delete Task")
                }
            }))
            .offset(y:-8)
          
            
        }
        
    }
}

#Preview {
    ContentView()
}
