import SwiftUI

struct PageOneView: View {
    
    @State private var userName: String = ""
    @State private var search: String = ""
    
    var body: some View {
        NavigationView{
            ZStack {
                Color.white
                    .edgesIgnoringSafeArea(.all)
                    .navigationBarItems(leading: Button(action: {}){
                        Image("hamburger")
                            .padding()
                    }, trailing: Button(action: {}){
                        AppBarView()
                    })
                    .toolbar {
                        ToolbarItem(placement: .principal) {
                            HStack {
                                Text("Trade by ")
                                    .font(.custom("Kanit-Medium", size: 28))
                                    .foregroundColor(Color.black)
                                + Text("bata")
                                    .font(.custom("Kanit-Bold", size: 28))
                                    .foregroundColor(Color("userTextColor"))
                            }
                        }
                    }
                
                VStack {
                    HStack {
                        
                        TextField("What are you looking for ?", text: $search)
                            .multilineTextAlignment(.leading)
                        Image("search")
                        
                    }
                    .frame(width: 300, height: 1)
                    .padding()
                    .font(.system(size: 15, weight: .light))
                    .background(Color("SearchFieldColour"))
                    .cornerRadius(50.0)
                }
            }
        }
        .padding(.top)
    }
}


struct PageOneView_Previews: PreviewProvider {
    static var previews: some View {
        PageOneView()
    }
}

struct AppBarView: View {
    var body: some View {
        VStack {
            Button(action: {
                
            }){
                Image("1")
            }
            HStack {
                Text("Location")
                    .font(.custom("Montserrat-Regular", size: 15))
                    .foregroundColor(.black .opacity(0.7))
                Button(action: {
                    //show user's location
                    
                }){
                    Image("chevron-arrow-down")
                        .foregroundColor(.black .opacity(0.8))
                }
                .padding(.leading, -8)
            }
        }
        .padding(.top,30)
        .padding(.leading,1)
    }
}
