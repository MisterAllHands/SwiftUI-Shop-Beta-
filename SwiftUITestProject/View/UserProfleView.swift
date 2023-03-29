//
//  UserProfleView.swift
//  SwiftUITestProject
//
//  Created by TTGMOTSF on 19/03/2023.
//

import SwiftUI

struct UserProfleView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @State private var userName = "Jordan B. Piterson"
    @State private var shouldShowImagePicker = false
    @State var image: UIImage!
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.white
                    .ignoresSafeArea()
                    .toolbar {
                        ToolbarItem(placement: .navigationBarLeading) {
                            Button {
                                presentationMode.wrappedValue.dismiss()
                            } label: {
                                if #available(iOS 16.0, *) {
                                    Image(systemName: "arrow.left")
                                        .foregroundColor(.black)
                                        .fontWeight(.bold)
                                } else {
                                    // Fallback on earlier versions
                                }
                            }

                        }
                        ToolbarItem(placement: .principal) {
                            Text("Profile")
                                .font(.custom("Kanit-SemiBold", size: 20))
                                .foregroundColor(Color.black)
                        }
                    }
                VStack{
                    Spacer()
                    Button {
                        //change image
                        shouldShowImagePicker.toggle()
                    } label: {
                        VStack(spacing: 10){
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
                            if #available(iOS 16.0, *) {
                                HStack {
                                    Image(systemName: "creditcard")
                                        .font(.system(size: 25))
                                    Text("Trade store")
                                }
                                .buttonStyle(PlainButtonStyle())
                                .padding(.vertical, 8)
                                .contentShape(Rectangle())
                                
                            } else {
                                // Fallback on earlier versions
                            }
                        }
                        
                        NavigationLink(destination: PaymentMethodView()) {
                            HStack {
                                Image(systemName: "creditcard")
                                    .font(.system(size: 25))

                                Text("Payment method")
                            }
                                           .buttonStyle(PlainButtonStyle())
                                           .padding(.vertical, 8)
                                           .contentShape(Rectangle())
                        }
                        
                        HStack {
                            Image(systemName: "creditcard")
                                .font(.system(size: 25))

                            Text("Balance")
                            Spacer()
                            Text("$1556")
                                .fontWeight(.medium)
                        }
                                       .buttonStyle(PlainButtonStyle())
                                       .padding(.vertical, 8)
                                       .contentShape(Rectangle())
                        
                        NavigationLink(destination: TradeHistoryView()) {
                            HStack {
                                Image(systemName: "creditcard")
                                    .font(.system(size: 25))

                                Text("Trade history")
                            }
                                           .buttonStyle(PlainButtonStyle())
                                           .padding(.vertical, 8)
                                           .contentShape(Rectangle())
                        }
                        
                        NavigationLink(destination: RestorePurchaseView()) {
                            HStack {
                                Image(systemName: "arrow.triangle.2.circlepath")
                                    .font(.system(size: 25))
                                Text("Restore purchase")
                            }
                                           .buttonStyle(PlainButtonStyle())
                                           .padding(.vertical, 8)
                                           .contentShape(Rectangle())
                                           
                        }
                        
                        Button(action: {
                            print("Help button tapped")
                        }) {
                            HStack {
                                Image(systemName: "questionmark.circle")
                                    .font(.system(size: 30))

                                Text("Help")
                            }
                                           .buttonStyle(PlainButtonStyle())
                                           .padding(.vertical, 8)
                                           .contentShape(Rectangle())
                        }
                        
                        Button(action: {
                            
                        }) {
                            HStack {
                                Image(systemName: "rectangle.portrait.and.arrow.forward")
                                Text("Log out")
                            }
                                           .buttonStyle(PlainButtonStyle())
                                           .padding(.vertical, 8)
                                           .contentShape(Rectangle())
                        }
                        
                    }
                    .listStyle(.plain)
                    .font(.custom("Kanit-Light", size: 20))
                    .padding()
                    
                }
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
                Text("Nothing to restore yet")
                    .font(.custom("Kanit-Medium", size: 30))
                    .padding()
            }
        }
    }
    
struct UserProfleView_Previews: PreviewProvider {
    static var previews: some View {
        UserProfleView()
    }
}
