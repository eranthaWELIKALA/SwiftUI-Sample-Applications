//
//  ContentView.swift
//  SwiftUINavigation-More
//
//  Created by Erantha Welikala on 12/3/21.
//

import SwiftUI

struct ContentView: View {
    @State var isShowingSecondView = false
    @State var isShowingThirdView = false
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Spacer()
                Text("Hi, Welcome to Root")
                    .font(.title)
                    .fontWeight(.bold)
                VStack {
                    Text("This is a NavigationLink")
                    NavigationLink(
                        destination: SecondView(),
                        isActive: $isShowingSecondView,
                        label: {
                            Text("Goto Second View")
                                .padding()
                                .background(Color.yellow)
                                .cornerRadius(10)
                        })
                }
                
                /*
                This will not show on the UI.
                This Link can be triggered
                by changing the isShowingThirdView.
                */
                NavigationLink(
                    destination: ThirdView(),
                    isActive: $isShowingThirdView) {
                    EmptyView()
                }
                
                
                VStack {
                    Text("These are Buttons")
                    Button(action: {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
                            self.isShowingSecondView = true
                        })
                    }, label: {
                        Text("Goto Second View after 2 Secs")
                            .padding()
                            .background(Color.orange)
                            .cornerRadius(10)
                    })
                    
                    Button(action: {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
                            self.isShowingThirdView = true
                        })
                    }, label: {
                        Text("Goto Third View after 2 Secs")
                            .padding()
                            .background(Color.pink)
                            .cornerRadius(10)
                    })
                }
                Spacer()
            }
            .navigationBarTitle("Root View")
            .frame(maxWidth: .infinity)
            .background(Color.blue)
            .ignoresSafeArea(.all)
        }
    }
}

struct SecondView: View {
    
    @State var selection: SVNavigationOptions? = nil
    
    var body: some View {
        VStack(alignment: .center) {
            Spacer()
            Text("Hi, Welcome to the Second")
                .font(.title)
                .fontWeight(.bold)
            NavigationLink(
                destination: ThirdView(),
                tag: SVNavigationOptions.third,
                selection: $selection) {
                    EmptyView()
                }
            NavigationLink(
                destination: FourthView(),
                tag: SVNavigationOptions.fourth,
                selection: $selection) {
                    EmptyView()
                }
            
            VStack {
                Button(action: {
                    self.selection = SVNavigationOptions.third
                }, label: {
                    Text("Goto Third View")
                        .padding()
                        .background(Color.pink)
                        .cornerRadius(10)
                })
                
                
                Button(action: {
                    self.selection = SVNavigationOptions.fourth
                }, label: {
                    Text("Goto Fourth")
                        .padding()
                        .background(Color.green)
                        .cornerRadius(10)
                })
            }
            Spacer()
        }
        .navigationBarTitle("Second View")
        .frame(maxWidth: .infinity)
        .background(Color.yellow)
        .ignoresSafeArea(.all)
    }
    
    enum SVNavigationOptions {
        case third, fourth
    }
}

struct ThirdView: View {
    
    var body: some View {
        VStack(alignment: .center) {
            Spacer()
            Text("Hi, Welcome to the Third")
                .font(.title)
                .fontWeight(.bold)
            Spacer()
        }
        .navigationBarTitle("Third View")
        .frame(maxWidth: .infinity)
        .background(Color.pink)
        .ignoresSafeArea(.all)
    }
}


struct FourthView: View {
    var body: some View {
        VStack(alignment: .center) {
            Spacer()
            Text("Hi, Welcome to the Fourth")
                .font(.title)
                .fontWeight(.bold)
            Spacer()
        }
        .navigationBarTitle("Fourth View")
        .frame(maxWidth: .infinity)
        .background(Color.green)
        .ignoresSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
