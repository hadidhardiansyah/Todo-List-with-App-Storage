//
//  ListView.swift
//  TodoList
//
//  Created by Hadid Hardiansyah Saputra on 22/10/23.
//

import SwiftUI

struct ListView: View {
    
    @EnvironmentObject var listViewModel: ListViewModel
    
    var body: some View {
        
        ZStack {
            if listViewModel.items.isEmpty {
                NoItemsView()
            } else {
                List {
                    ForEach(listViewModel.items) { item in
                        ListRowView(item: item)
                            .onTapGesture {
                                withAnimation(.linear(duration: 0.1)) {
                                    listViewModel.updateItem(item: item)
                                }
                            }
                    }
                    .onDelete(perform: listViewModel.deleteItem)
                    .onMove(perform: listViewModel.removeItem)
                }
                .listStyle(.plain)
            }
        }
        .navigationTitle("Todo List📝")
        .navigationBarItems(
            leading: EditButton(),
            trailing:
                NavigationLink(destination: {
                    AddView()
                }, label: {
                    Text("Add")
                })
        )
        
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ListView()
        }
        .environmentObject(ListViewModel())
    }
}
