//
//  ContentView.swift
//  BusCounter
//
//  Created by Michal Gruszkiewicz on 09/12/2021.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    @ObservedObject var viewModel = ContentViewModel()
    
    var body: some View {
        ZStack {
            Image("busBackground")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea(.all, edges: .all)
                .blur(radius: 4.0)
            
            VStack {
                Text("December 2021")
                    .font(.system(size: 42))
                    .bold()
                    .foregroundColor(.white)
                
                HStack {
                    /// Left buttons stack
                    VStack {
                        Text("Count: \($viewModel.normalTickets.wrappedValue)" as String)
                            .font(.system(size: 26))
                            .foregroundColor(.white)
                            .bold()
                        
                        Button {
                            viewModel.addTicket(type: .normal)
                        } label: {
                            Text("Normal")
                                .frame(width: 100, height: 100)
                                .foregroundColor(Color.black)
                                .background(Color.green)
                                .clipShape(Circle())
                        }
                        .foregroundColor(.black)
                        .padding()
                        
                        Button {
                            if viewModel.normalTickets > 0 {
                                viewModel.subtractTicket(type: .normal)
                            }
                        } label: {
                            Text("-")
                                .frame(width: 50, height: 50)
                                .foregroundColor(Color.black)
                                .background(Color.red)
                                .clipShape(Circle())
                        }
                        .foregroundColor(.black)
                    }
                    
                    /// Right buttons stack
                    VStack {
                        Text("Count: \($viewModel.quaterTickets.wrappedValue)" as String)
                            .font(.system(size: 26))
                            .foregroundColor(.white)
                            .bold()
                        
                        Button {
                            viewModel.addTicket(type: .quater)
                        } label: {
                            Text("15 min")
                                .frame(width: 100, height: 100)
                                .foregroundColor(Color.black)
                                .background(Color.yellow)
                                .clipShape(Circle())
                        }
                        .foregroundColor(.black)
                        .padding()
                        
                        Button {
                            if viewModel.quaterTickets > 0 {
                                viewModel.subtractTicket(type: .quater)
                            }
                        } label: {
                            Text("-")
                                .frame(width: 50, height: 50)
                                .foregroundColor(Color.black)
                                .background(Color.red)
                                .clipShape(Circle())
                        }
                        .foregroundColor(.black)
                    }
                    
                    
                }
                .padding()
                
                Text("Saved money: \(String(format: "%.2f", $viewModel.savedMoney.wrappedValue)) pln")
                    .foregroundColor(.white)
                    .bold()
            }
        }
    }
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
