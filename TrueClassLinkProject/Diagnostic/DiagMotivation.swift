//
//  DiagMotivation.swift
//  TrueClassLinkProject
//
//  Created by Apprenant98 on 12/03/2024.
//

import SwiftUI

// Définition de la classe ViewModel

class MotivationViewModel: ObservableObject {
    
    @Published var motivation: [Motivation] = [
        
        Motivation(question: "Qu'est-ce qui te motive à venir à l'école ?", options: [
            "Apprendre, poursuivre mes études",
            "Partager des moments avec mes amis",
            "Me sentir inclus.e malgré mes difficultés ou mon handicap",
            "Construire mon projet d'avenir",
            "Sortir de chez moi"
        ]),
        
        Motivation(question: "Où te vois-tu dans l'avenir ?", options: [
            "Je me vois bien travailler dans une grande entreprise ou un grand groupe",
            "Je me verrai bien avoir ma propre petite entreprise",
            "J'aimerais faire des études longues",
            "Je ne sais pas trop vers quel domaine m'orienter",
            "Je n'ai pas envie de penser à mon avenir, ça m'angoisse"
        ])
    ]
    
    func selectOption(questionIndex: Int, optionIndex: Int) {
        
        motivation[questionIndex].options[optionIndex].isSelected.toggle()
    }
    
    func validate() -> Bool {
        
        // ici logique de validation
        for motivation in motivation {
            for option in motivation.options {
                if option.isSelected {
                    return false
                }
            }
        }
        return true
    }
}

// Définition de la structure Motivation

struct Motivation {
    
    let question: String
    var options: [Option]
    
    init(question: String, options: [String]) {
        
        self.question = question
        self.options = options.map { Option(text: $0) }
    }
}

// Définition de la structure Option

struct Option {
    let text: String
    var isSelected: Bool = false
}

// Définition de la vue principale DiagMotivationView

struct DiagMotivation: View {
    @StateObject var viewModel = MotivationViewModel()
    @State private var selection = 0
    @State private var shouldAnimateButton = false
    //    @State private var isPressed = false
    //    @State private var isHovered = false
    var mess: Message
    var hist: MessageHistorique
    var body: some View {
        //        NavigationView {
        ZStack {
            Image("backgroundBase")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                
                
                
                TabView(selection: $selection) {
                    DepartNavView(mess: mess, hist: hist)
                        .tag(0)
                    
                    DiagExpectations(mess: mess, hist: hist)
                        .tag(1)
                    DiagDifficulties(hist: hist, mess: mess)
                        .tag(2)
                    QuestionListView(viewModel: viewModel, selection: $selection)
                        .tag(1)
                }
                
                
                VStack {
                    if viewModel.validate() && selection < 2 {
                        Button(action: {
                           
                                selection += 1
                            
                            withAnimation {
                                shouldAnimateButton.toggle()
                            }
                        }){
                            
                            Text("Valider")
                                .font(.custom("SFPro-bold", size: 24))
                                .foregroundColor(.white)
                                .padding()
                                .frame(width: 236, height: 60)
                                .background(Color.orangeEdu)
                                .cornerRadius(50)
                                .offset(x: 0, y: -20)
                        }
                        .padding(.bottom)
                        .frame(maxWidth: .infinity)
                    } else if selection >= 2 {
                        NavigationLink(destination: MainView(hist: hist, mess: mess)) {
                                Text("Valider")
                                    .font(.custom("SFPro-bold", size: 24))
                                    .foregroundColor(.white)
                                    .padding()
                                    .frame(width: 236, height: 60)
                                    .background(Color.orangeEdu)
                                    .cornerRadius(50)
                                    .offset(x: 0, y: -20)
                            
//                            .padding(.bottom)
//                            .frame(maxWidth: .infinity)
                        }
                        
                    }
                        
                   
                    
                    HStack(spacing: 20) {
                        ForEach(0..<3) { index in
                            Circle()
                                .frame(width: 10, height: 10)
                                .foregroundColor(index == selection ? Color.orange : Color.gray)
                                .scaleEffect(index == selection ? 1.2 : 1.0, anchor: .center)
                                .animation(.easeInOut(duration: 0.5), value:selection)
                        }
                    }
                    .padding(.top, 20)
                    .offset(x: 0, y: -50)
                }
            }
        }
    }
}
// Définition de la structure QuestionListView

struct QuestionListView: View {
    
    @ObservedObject var viewModel: MotivationViewModel
    @Binding var selection: Int
    
    var body: some View {
        
        ScrollView {
            
            ForEach(viewModel.motivation.indices, id: \.self) { index in
                
                VStack(alignment: .leading, spacing: 10) {
                    Text(viewModel.motivation[index].question)
                        .font(.custom("SFPro-Regular", size: 18))
                        .foregroundColor(.black)
                        .offset(x:15, y: 13)
                        .padding()
                    
                    ForEach(viewModel.motivation[index].options.indices, id: \.self) { optionIndex in
                        
                        OptionView(option: viewModel.motivation[index].options[optionIndex], questionIndex: index, optionIndex: optionIndex, viewModel: viewModel)
                        
                    }
                    
                }
                
            }
            
        }
        
    }
    
}



// Définition de la structure OptionView

struct OptionView: View {
    let option: Option
    let questionIndex: Int
    let optionIndex: Int
    @ObservedObject var viewModel: MotivationViewModel
    
    var body: some View {
        
        Button(action: {
            viewModel.selectOption(questionIndex: questionIndex, optionIndex: optionIndex)
            
        }) {
            
            VStack(alignment: .leading) {
                
                HStack {
                    Spacer()
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.orange, lineWidth: 2)
                            .frame(width: 360, height: 60)
                            .offset(x:5, y: -1)
                        
                        Text(option.text)
                            .font(.custom("SFPro-Regular", size: 16))
                            .foregroundColor(.black)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .lineLimit(2)
                            .multilineTextAlignment(.leading)
                            .frame(maxWidth: 290)
                            .offset(x:-20, y: -1)
                        
                        Spacer()
                        
                        Circle()
                            .stroke(Color.gray, lineWidth: 1.5)
                            .frame(width: 30, height: 30)
                            .foregroundColor(option.isSelected ? Color.orangeEdu : Color.clear)
                            .offset(x:160, y: -1)
                        if option.isSelected {
                            Circle()
                                .fill(Color.orangeEdu)
                                .frame(width: 30, height: 30)
                                .offset(x:160, y: -1)
                        }
                    }
                    .padding(.trailing)
                }
            }
            .padding(.horizontal)
        }
    }
}
//        }

#Preview {
    DiagMotivation(mess: Message(auteur: User(email: "", mdp: "", name: "", surname: "", mood: Mood(moodIcon: ""), enCeMoment: EnCeMoment(myMusic: "", myPride: "", myChallenge: "")), destinaire: User(email: "", mdp: "", name: "", surname: "", mood: Mood(moodIcon: ""), enCeMoment: EnCeMoment(myMusic: "", myPride: "", myChallenge: "")), typeQuestion: .poserQuest, message: "")
, hist: MessageHistorique())
}
