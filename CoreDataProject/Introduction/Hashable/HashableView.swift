//
//  HashableView.swift
//  CoreDataProject
//
//  Created by Fauzan Dwi Prasetyo on 30/06/23.
//

import SwiftUI

struct Student: Hashable {
    let name: String
}

struct HashableView: View {
    let students = [Student(name: "Harry Potter"), Student(name: "Hermione Granger"), Student(name: "Hermione Granger")]

    var body: some View {
        List(students, id: \.self) { student in
            Text(student.name)
        }
    }
}

struct HashableView_Previews: PreviewProvider {
    static var previews: some View {
        HashableView()
    }
}
