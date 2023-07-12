//
//  TaskView.swift
//  TaskManagementApp
//
//  Created by Bilal SIMSEK on 12.07.2023.
//

import SwiftUI
import SwiftData

struct TasksView: View {
    @Binding var currentDate:Date
    
    @Query private var tasks:[Task]
    
    init(currentDate:Binding<Date>) {
        
        self._currentDate = currentDate
        let calendar = Calendar.current
        let startOfDate = calendar.startOfDay(for: currentDate.wrappedValue)
        let endOfDate = calendar.date(byAdding: .day, value: 1, to: startOfDate)!
        let predicate = #Predicate<Task>{
            return $0.creationDate > startOfDate && $0.creationDate < endOfDate
        }
        
        let sortDescriptor = [
            SortDescriptor(\Task.creationDate,order: .reverse)
        ]
        
        self._tasks = Query(filter: predicate, sort: sortDescriptor,animation: .snappy)
        
    }
    var body: some View {
        VStack(alignment:.leading,spacing:35) {
            
            ForEach(tasks) { task in
               TaskRowView(task: task)
                    .background(alignment:.leading){
                        if tasks.last?.id != task.id{
                            Rectangle()
                                .frame(width: 1)
                                .offset(x:8)
                                .padding(.bottom,-35)
                        }
                    }
                    
          }
        }
        .padding([.leading,.vertical],15)
        .padding(.top,15)
        
        .overlay {
            if tasks.isEmpty{
                Text("No Tasks found")
                    .font(.caption)
                    .foregroundStyle(.gray)
                    .frame(width:150)
            }
        }
    }
}

#Preview {
    ContentView()
}
