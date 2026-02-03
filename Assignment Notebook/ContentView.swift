//
//  ContentView.swift
//  Assignment Notebook
//
//  Created by Katherine Pizzirusso on 1/28/26.
//

import SwiftUI

struct ContentView: View {
    @State private var assignmentList = AssignmentList()
    @State private var showingAddAssignmentView = false
    var body: some View {
        NavigationView {
            List {
                ForEach(assignmentList.items) { item in
                    HStack {
                        VStack(alignment: .leading) {
                            CustomText(text:item.course)
                                .font(.headline).foregroundStyle(.white)
                            CustomText1(text:item.description)
                                .foregroundStyle(.white)
                        }
                        Spacer()
                        Text(item.dueDate, style: .date).foregroundStyle(.white)
                        
                    }
                    .background(Color.PINK)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                        
                }
                
                .onMove(perform: { indices, newOffset in
                    assignmentList.items.move(fromOffsets: indices, toOffset: newOffset)
                })
                .onDelete(perform: { indexSet in
                    assignmentList.items.remove(atOffsets: indexSet)
                })
            }
            .background(Color.PINK)
            .sheet(isPresented: $showingAddAssignmentView) {
                AddAssignmentView()
                    .environment(assignmentList)
                }
            .navigationBarTitle("Assignment Notebook", displayMode: .inline)
            .font(Font.custom("Chalkboard SE", size: 18))
          //  .foregroundStyle(.white)
                .navigationBarItems(leading: EditButton().background(Color.PINK).clipShape(RoundedRectangle(cornerRadius: 12))
                    .foregroundStyle(.white)
                    .font(Font.custom("Chalkboard SE", size: 20)),
                                    trailing: Button(action: {
                                    showingAddAssignmentView = true
                                    }, label: {
                                    Image(systemName: "plus.circle.fill")
                                            .foregroundStyle(Color.PINK)
                                        .font(.title2)
                                        
                                                }))
            
            
            }
        .background(Color.PINK)
        }
    }


#Preview {
    ContentView()
}
struct CustomText: View {
    let text: String
    var body: some View {
        Text(text).font(Font.custom("Chalkboard SE", size: 30))
    }
}
struct CustomText1: View {
    let text: String
    var body: some View {
        Text(text).font(Font.custom("Chalkboard SE", size: 20))
    }
}
struct CustomText2: View {
    let text: String
    var body: some View {
        Text(text).font(Font.custom("Chalkboard SE", size: 15))
    }
}
struct AssignmentItem: Identifiable, Codable {
    var id = UUID()
    var course = String()
    var description = String()
    var dueDate = Date()
}
