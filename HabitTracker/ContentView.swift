//
//  ContentView.swift
//  HabitTracker
//
//  Created by Amir Kabiri on 3/1/24.
//

import SwiftUI


struct ContentView: View {
    @State private var data = Activities()
    @State private var addingNewActivity = false
    
    var body: some View {
        NavigationStack {
            List(data.activities) { activity in
                NavigationLink {
                    Text("Detail view")
                } label: {
                    HStack {
                        Text(activity.title)
                        
                        Spacer()
                        
                        Text(String(activity.completionCount))
                    }
                }
            }
            .navigationTitle("Habit Tracker")
            .toolbar {
                Button("Add new activity", systemImage: "plus") {
                    addingNewActivity.toggle()
                }
            }
            .sheet(isPresented: $addingNewActivity) {
                AddActivity(data: data)
            }
        }
    }
}


#Preview {
    ContentView()
}
