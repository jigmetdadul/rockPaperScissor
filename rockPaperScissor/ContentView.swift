//
//  ContentView.swift
//  rockPaperScissor
//
//  Created by Jigmet stanzin Dadul on 26/01/24.
//

import SwiftUI

struct ContentView: View {
    @State private var playerMove = 0
    @State private var computerMove = 0
    @State private var playerScore = 0
    @State private var computerScore = 0
    @State private var alertShow = false
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    private let moves = ["✊", "👋", "✌️"]

    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [.gray, .green, .blue]), startPoint: .top, endPoint: .bottom)
                    .edgesIgnoringSafeArea(.all)

                VStack {
                    HStack {
                        Text("Score: \(playerScore)").padding(.leading, 10).bold()
                        Spacer(minLength: 10)
                        Text("Computer score: \(computerScore)").padding(.trailing, 10).bold()
                    }
                    .padding(20)
                    .background(.thickMaterial)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .frame(maxWidth: .infinity)
                    
                    VStack {
                        Text("Computer's Move").fontWeight(.black).font(.system(size: 25))
                        Text(displayMove(moveVal: computerMove)).font(.system(size: 40))
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 10)
                    .background(.thinMaterial)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    Spacer()
                    VStack {
                        Text("Choose Your move").fontWeight(.black).font(.system(size: 25))

                        HStack {
                            ForEach(moves, id: \.self) { move in
                                Button(move) {
                                    playerMove = moves.firstIndex(of: move) ?? 0
                                    judgeMoves()
                                }
                                .font(.system(size: 40))
                                .buttonStyle(.bordered)
                                .padding(20)
                                .tint(.red)
                            }
                        }
                        .padding()
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 10)
                    .background(.thinMaterial)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                }
                .navigationTitle("Test your luck")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    Button("Reset") {
                        playerScore = 0
                        computerScore = 0
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(.orange)
                    .foregroundStyle(.black)
                }
                .alert(alertTitle, isPresented: $alertShow) {
                    Button("Play Again") {
                        alertShow = false
                         
                    }
                }
            }
        }
    }

    func displayMove(moveVal: Int) -> String {
        return moves[moveVal]
    }

    func judgeMoves() {
        computerMove = Int.random(in: 0..<moves.count)

        if playerMove == computerMove {
            alertTitle = "It's a Tie!"
        } else if (playerMove + 1) % moves.count == computerMove {
            playerScore += 1
            alertTitle = "You Win!"
        } else {
            computerScore += 1
            alertTitle = "Computer Wins!"
        }

        alertShow = true
    }
}


#Preview {
    ContentView()
}
