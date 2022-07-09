import SwiftUI

struct ContentView: View {
    @State var isNewFriendPresented = false
    @State var friends: [Friend] = [
        Friend(
            name: "person1",
            icon: "globe",
            school: "SST 👍",
            cursedImage: "Dora egghead",
            attack: 10,
            defense: 5,
            types: [.grass, .water]
        ),
        Friend(
            name: "person2",
            icon: "mail",
            school: "SST 👍",
            cursedImage: "Map",
            attack: 5,
            defense: 10,
            types: [.normal, .electric]
        ),
        Friend(
            name: "person3",
            icon: "swift",
            school: "SST 👍",
            cursedImage: "rick astley",
            attack: 15,
            defense: 10,
            types: [.ice, .fire]
        )
    ]
    var body: some View {
        NavigationView {
            List {
                ForEach(friends) { friend in
                    let index = friends.firstIndex(of: friend)!
                    NavigationLink(destination: FriendDetailView(friend: $friends[index])) {
                        Image(systemName: friend.icon)
                        VStack(alignment: .leading){
                            Text(friend.name)
                            HStack{
                                Text(friend.school)
                                Spacer()
                                ForEach(friend.types, id: \.rawValue) { type in
                                    Image(systemName: type.getSymbolName())
                                }
                            }
                        }
                    }
                }
                .onDelete { offset in
                    friends.remove(atOffsets: offset)
                }
                .onMove { source, destination in
                    friends.move(fromOffsets: source, toOffset: destination)
                }
            }
            .navigationTitle("Friends")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        isNewFriendPresented = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
        }.sheet(isPresented: $isNewFriendPresented) {
            NewFriendView(friends: $friends, isNewFriendPresented: $isNewFriendPresented)
        }
        
    }
}
