//
//  AddAssignmentView.swift
//  Assignment Notebook
//
//  Created by Katherine Pizzirusso on 1/28/26.
//

import SwiftUI

struct AddAssignmentView: View {
    
    @State private var course = ""
    @State private var descripton = ""
    @State private var dueDate: Date = Date()
    
    @Environment(AssignmentList.self) var assignmentList
    @Environment(\.dismiss) var dismiss
    static let courses = ["Math", "Science", "History", "Art", "Music"]
    var body: some View {
        NavigationView {
            Form {
                Picker("Course", selection: $course) {
                    ForEach(Self.courses, id: \.self) { course in
                        Text(course)
                        
                    }
                }
            }
        }
    }
}
