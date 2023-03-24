//
//  UserProfleView.swift
//  SwiftUITestProject
//
//  Created by TTGMOTSF on 19/03/2023.
//

import SwiftUI

struct UserProfleView: View {
    
    @State private var userName = "Jordan B. Piterson"
    @State private var shouldShowImagePicker = false
    @State var image: UIImage!
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.white
                    .ignoresSafeArea()
                    .toolbar {
                        ToolbarItem(placement: .principal) {
                            Text("Profile")
                                .font(.custom("Kanit-SemiBold", size: 20))
                                .foregroundColor(Color.black)
                        }
                    }
                VStack {
                    Button {
                        //change image
                        shouldShowImagePicker.toggle()
                    } label: {
                        VStack {
                            VStack {
                                if let image = self.image {
                                    Image(uiImage: image)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 100, height: 100)
                                        .cornerRadius(50)
                                } else{
                                    Image(systemName: "person.fill")
                                        .font(.system(size: 70))
                                }
                            }
                            .overlay(RoundedRectangle(cornerRadius: 70)
                                .stroke(Color.black .opacity(0.5), lineWidth: 1))
                            .foregroundColor(.black .opacity(0.5))
                            
                            Text("Change photo")
                                .font(.custom("Kanit-Light", size: 15))
                                .foregroundColor(.black .opacity(0.8))
                        }
                    }
                    .padding()
                    Text("\(userName)")
                        .font(.custom("Kanit-Medium", size: 23))
                    
                    if #available(iOS 16.0, *) {
                        Button {
                            Text("Upload successfully")
                        } label: {
                            HStack{
                                Image(systemName: "square.and.arrow.up")
                                    .padding(.trailing)
                                Text("Upload item")
                                    .padding(.trailing)
                            }
                        }
                        .frame(width: 300, height: 50)
                        .background(Color("ButtonColor"))
                        .foregroundColor(.white)
                        .cornerRadius(20)
                        .padding()
                        .bold()
                    } else {
                        // Fallback on earlier versions
                    }
                    List {
                        NavigationLink(destination: TradeStoreView()) {
                            HStack {
                                Image(systemName: "creditcard")
                                Text("Trade store")
                            }
                        }
                        
                        NavigationLink(destination: PaymentMethodView()) {
                            HStack {
                                Image(systemName: "creditcard")
                                Text("Payment method")
                            }
                        }
                        
                        HStack {
                            Image(systemName: "creditcard")
                            Text("Balance")
                            Spacer()
                            Text("$1556")
                        }
                        
                        NavigationLink(destination: TradeHistoryView()) {
                            HStack {
                                Image(systemName: "creditcard")
                                Text("Trade history")
                            }
                        }
                        
                        NavigationLink(destination: RestorePurchaseView()) {
                            HStack {
                                Image(systemName: "arrow.clockwise")
                                Text("Restore purchase")
                            }
                            
                        }
                        
                        Button(action: {
                            print("Help button tapped")
                        }) {
                            HStack {
                                Image(systemName: "questionmark.circle")
                                Text("Help")
                            }
                        }
                        
                        Button(action: {
                            print("Log out button tapped")
                        }) {
                            Text("Log out")
                                
                        }
                    }
                    .listStyle(.plain)
                    .font(.custom("Kanit-Light", size: 20))
                    .padding()
                }
                .navigationViewStyle(.stack)
                .fullScreenCover(isPresented: $shouldShowImagePicker, onDismiss: nil) {
                    ImagePicker(image: $image)
                }
            }
        }
    }
    
    struct TradeStoreView: View {
        var body: some View {
            Text("Trade store view")
                .font(.title)
                .padding()
        }
    }
    
    struct PaymentMethodView: View {
        var body: some View {
            Text("Payment method view")
                .font(.title)
                .padding()
        }
    }
    
    struct TradeHistoryView: View {
        var body: some View {
            Text("Trade history view")
                .font(.title)
                .padding()
        }
    }
    
    struct RestorePurchaseView: View {
        var body: some View {
            Text("Restore purchase view")
                .font(.title)
                .padding()
        }
    }
}
struct UserProfleView_Previews: PreviewProvider {
    static var previews: some View {
        UserProfleView()
    }
}
struct NavigationLinkArrowStyle: ViewModifier {
    func body(content: Content) -> some View {
        if #available(iOS 16.0, *) {
            content
                .overlay(
                    Image(systemName: "chevron.right")
                        .font(.headline)
                        .fontWeight(.bold)
                        .padding(.trailing, 4)
                        .foregroundColor(.gray),
                    alignment: .trailing
                )
        } else {
            // Fallback on earlier versions
        }
    }
}
