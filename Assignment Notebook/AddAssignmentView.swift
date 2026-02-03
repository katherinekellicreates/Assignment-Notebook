//
//  AddAssignmentView.swift
//  Assignment Notebook
//
//  Created by Katherine Pizzirusso on 1/28/26.
//

import SwiftUI



struct AddAssignmentView: View {
    
    @Environment(AssignmentList.self) var assignmentList
    @Environment(\.dismiss) var dismiss
    static let courses = ["Math 101", "Acting", "Mobile Apps", "English 101", "Resource", "Graphic Design"]
    @State private var course = ""
    @State private var description = ""
    @State private var dueDate: Date = Date()
    
    var body: some View {
        NavigationView {
            
        //    CustomText("Test")
              //  .font(.custom("Bobogo", size: 24))
            Form {
                Picker("Course", selection: $course) {
                    ForEach(Self.courses, id: \.self) { course in
                        Text(course).foregroundStyle(.white).font(Font.custom("Chalkboard SE", size: 18))
                    }
                }
               TextField("Description", text: $description)
                    .font(Font.custom("Chalkboard SE", size: 18))
                DatePicker("Due Date", selection: $dueDate, displayedComponents: .date)
                    .font(Font.custom("Chalkboard SE", size: 18))
            }
            .font(Font.custom("Chalkboard SE", size: 18))
            .background(Color.pink)
            .navigationBarTitle("Add New Assignment", displayMode: .inline)
            .navigationBarItems(trailing: Button("Save") {
                if course.count > 0, description.count > 0 {
                    let item = AssignmentItem(course: course, description: description, dueDate: dueDate)
                    assignmentList.items.append(item)
                    dismiss()
                }
            })
        }
    }
}
