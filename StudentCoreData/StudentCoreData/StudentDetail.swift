//
//  StudentDetail.swift
//  StudentCoreData
//
//  Created by Vanieka Sharma on 14/09/2023.
//

import SwiftUI

struct StudentDetail: View {
    let student: Student
    @State private var studentName: String = ""
    let coreDM: CoreDataManager
    @Binding var needsRefresh: Bool
    
    var body: some View {
        VStack {
            TextField(student.name ?? "", text: $studentName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            Button("Update") {
                if !studentName.isEmpty {
                    student.name = studentName
                    coreDM.updateStudent()
                    needsRefresh.toggle()
                }
            }
        }
        .padding()
        Text(student.name ?? "")
        Spacer()
    }
}

struct StudentDetail_Previews: PreviewProvider {
    static var previews: some View {
        let student = Student()
        let coreDM = CoreDataManager()
        
        StudentDetail(student: student, coreDM: CoreDataManager(), needsRefresh: .constant(false))
    }
}
