//
//  ContentView.swift
//  myOwnSpace
//
//  Created by Ebbyy on 2022/12/07.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @StateObject var baseData = BaseViewModel()
    @ObservedObject var moodModelController = MoodModelController()
    @Environment(\.managedObjectContext) private var viewContext

//    @FetchRequest(
//        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
//        animation: .default)
//    private var items: FetchedResults<Item>
    
    //hide tab bar
    init() {
        UITabBar.appearance().isHidden = true
    }

    var body: some View {
        NavigationView {
        TabView(selection: $baseData.currentTab ) {
            HomeView()
                .environmentObject(baseData)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.black.opacity(0.04))
                .tag(Tab.Home)
            DiaryView()
                .tag(Tab.Diary)
            GraphView(diarys: [Diary(mood: Mood.happy, date: Date()), Diary(mood: .soHappy, date: Date())], graph: [GraphModel(date: dateToy(), value: 2.5), GraphModel(date: Date(), value: 5)])
                .tag(Tab.Graph)
            SettingView()
                .tag(Tab.Setting)
        }
        .overlay(
            // MARK: - CUSTOM TAB BAR
            HStack(spacing: 0) {
                // MARK: - TAB BUTTON
                TabButton(Tab: .Home)
                TabButton(Tab: .Diary)
                    .offset(x: -10)
                
                // MARK: CURVED BUTTON
                NavigationLink(destination: AddNewDiary(moodModelController: self.moodModelController)) {
                        Image(systemName: "plus")
                            .resizable()
                            .renderingMode(.template)
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 26, height: 26)
                            .offset(x: -1)
                            .padding(18)
                            .foregroundColor(Color.white)
                            .background(Color("B28BF5"))
                            .clipShape(Circle())
                        //MAR: - BUTTON SHADOWS
                            .shadow(color: Color.black.opacity(0.04), radius: 5, x: 5, y: 5)
                            .shadow(color: Color.black.opacity(0.04), radius: 5, x: -5, y: -5)
                    }
                    .offset(y: -25)
                    .onTapGesture {
                        baseData.showDetail = true
                    }
                                
                TabButton2(Tab: .Graph)
                    .offset(x: 10)
                TabButton2(Tab: .Setting)
            }
            .background(
                Color("252328")
                    .clipShape(TabBarShape())
                    //MARK: - SHADOW
                    .shadow(color: Color.white.opacity(0.04), radius: 5, x: -5, y: -5)
                    .ignoresSafeArea(.container, edges: .bottom)
            )
            //MARK: - HIDE TAB ON DETAIL VIEW
            .offset(y: baseData.showDetail ? 500 : 0)
            
            , alignment: .bottom
        )
        
    }
}
    
    
    
    @ViewBuilder
    func TabButton(Tab: Tab)-> some View {
        Button {
            withAnimation{
                baseData.currentTab = Tab
            }
        } label: {
            Image(systemName: Tab.rawValue)
                .resizable()
                .renderingMode(.template)
                .aspectRatio(contentMode: .fit)
                .frame(width: 25, height: 25)
                .foregroundColor(baseData.currentTab == Tab ? Color("B28BF5") : Color.gray.opacity(0.5))
                .frame(maxWidth: .infinity)
        }
    }
    
    @ViewBuilder
    func TabButton2(Tab: Tab)-> some View {
        Button {
            withAnimation{
                baseData.currentTab = Tab
            }
        } label: {
            Image(Tab.rawValue)
                .resizable()
                .renderingMode(.template)
                .aspectRatio(contentMode: .fit)
                .frame(width: 25, height: 25)
                .foregroundColor(baseData.currentTab == Tab ? Color("B28BF5") : Color.gray.opacity(0.5))
                .frame(maxWidth: .infinity)
        }
    }
    
//        NavigationView {
//            List {
//                ForEach(items) { item in
//                    NavigationLink {
//                        Text("Item at \(item.timestamp!, formatter: itemFormatter)")
//                    } label: {
//                        Text(item.timestamp!, formatter: itemFormatter)
//                    }
//                }
//                .onDelete(perform: deleteItems)
//            }
//            .toolbar {
//                ToolbarItem(placement: .navigationBarTrailing) {
//                    EditButton()
//                }
//                ToolbarItem {
//                    Button(action: addItem) {
//                        Label("Add Item", systemImage: "plus")
//                    }
//                }
//            }
//            Text("Select an item")
//        }

//    private func addItem() {
//        withAnimation {
//            let newItem = Item(context: viewContext)
//            newItem.timestamp = Date()
//
//            do {
//                try viewContext.save()
//            } catch {
//                // Replace this implementation with code to handle the error appropriately.
//                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
//                let nsError = error as NSError
//                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
//            }
//        }
//    }
//
//    private func deleteItems(offsets: IndexSet) {
//        withAnimation {
//            offsets.map { items[$0] }.forEach(viewContext.delete)
//
//            do {
//                try viewContext.save()
//            } catch {
//                // Replace this implementation with code to handle the error appropriately.
//                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
//                let nsError = error as NSError
//                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
//            }
//        }
//    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
