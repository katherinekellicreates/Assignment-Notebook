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
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    AddAssignmentView()
}
