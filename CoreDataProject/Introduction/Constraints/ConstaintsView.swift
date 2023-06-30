//
//  ConstaintsView.swift
//  CoreDataProject
//
//  Created by Fauzan Dwi Prasetyo on 30/06/23.
//

import SwiftUI

struct ConstaintsView: View {
    @Environment(\.managedObjectContext) var moc
    
    @FetchRequest(sortDescriptors: []) var wizards: FetchedResults<Wizard>
    
    var body: some View {
        VStack {
            List(wizards, id: \.self) { wizard in
                Text(wizard.name ?? "Unknown")
            }
            
            Button("Add") {
                let wizard = Wizard(context: moc)
                wizard.name = "Harry Potter"
            }
            
            Button("Save") {
                if moc.hasChanges {
                    do {
                        try moc.save()
                    } catch {
                        print("\(error.localizedDescription)")
                    }
                }
            }
        }
    }
}

struct ConstaintsView_Previews: PreviewProvider {
    static var previews: some View {
        ConstaintsView()
    }
}
