//
//  DiagExpectations.swift
//  TrueClassLinkProject
//
//  Created by Apprenant98 on 12/03/2024.
//

import SwiftUI

class ExpectationsViewModel: ObservableObject {
    
    @Published var expectations: [Expectations] = [
        
        Expectations(question: "Quelles sont tes attentes par rapport à l’école ?", options: [
            
            "M’aider à choisir mon parcours et mon orientation",
            
            "Être conseillé.e en cas de difficulté",
            
            "Trouver un métier au plus vite",
            
            "Autres (explique ici tes autres attentes",
            
            
            
        ]),
        
        Expectations(question: "Quelles sont les aides dont tu aimerais bénéficier ?", options: [
            
            "J’aimerais pouvoir parler avec une personne de confiance",
            
            "J’aimerais une sorte de tutorat entre élèves pour les devoirs",
            
            "J’aimerais que l’école mette en place des dispositifs d’accessibilité",
            
            "J’aimerais qu’il y ait davantage de projets scolaires dans la classe ou l’établissement",
            
            
        ])
        
    ]
    
    
    
    func selectOption(questionIndex: Int, optionIndex: Int) {
        
        expectations[questionIndex].options[optionIndex].isSelected.toggle()
        
    }
    
    
    
    func validate() -> Bool {
        
        // ici logique de validation
        for expectations in expectations {
            for option in expectations.options {
                if option.isSelected {
                    return false
                }
            }
        }
        
        return true
        
    }
    
}



// Définition de la structure Motivation

struct Expectations {
    
    let question: String
    var options: [Option]
    
    
    
    init(question: String, options: [String]) {
        self.question = question
        self.options = options.map { Option(text: $0) }
        
    }
    
}

// Définition de la structure Option

struct Myoption {
    
    let text: String
    var isSelected: Bool = false
    
}

// Définition de la vue principale

struct DiagExpectations: View {
    
    @StateObject var viewModel = ExpectationsViewModel()
    @State private var selection = 1
    @State private var shouldAnimateButton = false
    var mess: Message
    var hist: MessageHistorique
    
    var body: some View {
        NavigationView {
            ZStack {
                Image("backgroundBase")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    
                    Text("Tes attentes")
                        .font(.custom("SF Pro", size: 24))
                        .fontWeight(.bold)
                        .foregroundColor(Color.orangeEdu)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding(.top,80)
                        .padding(30)
                    
                    VStack {
                        TabView(selection: $selection) {
                            QuestionListView(viewModel: viewModel, selection: $selection)
                                .tag(1)
                            
                            DiagExpectations(mess: mess, hist: hist)
                                .tag(1)
                            DiagDifficulties(hist: hist, mess: mess)
                                .tag(2)
                            QuestionListView(viewModel: viewModel, selection: $selection)
                                .tag(1)
                            
                            
                        }
                        .gesture(DragGesture().onEnded { gesture in
                            //                if gesture.translation.width > 100 && selection > 0 {
                            //                    selection -= 1
                            if gesture.translation.width < -100 && selection < 2 {
                                selection += 1 /*swipe vers la gauche*/
                            } else if gesture.translation.width > 100 && selection > 0 {
                                //                    if selection == 2 {
                                selection -= 1 /*revenir à l'écran 2*/
                                //                    } else {
                                selection -= 1 /*swipe vers la droite*/
                            }
                            //                                    }
                            //                                    print("Selection: \(selection)")
                        })
                        
                        
                        VStack {
                            
                            
                            HStack(spacing: 20) {
                                ForEach(0..<3) { index in
                                    Circle()
                                        .frame(width: 10, height: 10)
                                        .foregroundColor(index == selection ? Color.orangeEdu : Color.gray)
                                        .scaleEffect(index == 1  /*selection*/ ? 1.2 : 1.0, anchor: .center)
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
    }
    // Définition de la structure QuestionListView
    
    struct QuestionListView: View {
        
        @ObservedObject var viewModel:
        ExpectationsViewModel
        @Binding var selection: Int
        
        var body: some View {
            
            ScrollView {
                
                ForEach(viewModel.expectations.indices, id: \.self) { index in
                    
                    VStack(alignment: .leading, spacing: 10) {
                        Text(viewModel.expectations[index].question)
                            .font(.custom("SFPro-Regular", size: 18))
                            .foregroundColor(.black)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .lineLimit(2)
                            .multilineTextAlignment(.leading)
                            .frame(maxWidth: 375)
                            .offset(x:15, y: 13)
                            .padding()
                        
                        ForEach(viewModel.expectations[index].options.indices, id: \.self) { optionIndex in
                            
                            OptionView(option: viewModel.expectations[index].options[optionIndex], questionIndex: index, optionIndex: optionIndex, viewModel: viewModel)
                            
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
        @ObservedObject var viewModel: ExpectationsViewModel
        
        var body: some View {
            
            Button(action: {
                viewModel.selectOption(questionIndex: questionIndex, optionIndex: optionIndex)
                
            }) {
                
                VStack(alignment: .leading) {
                    
                    HStack {
                        Spacer()
                        
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.orangeEdu, lineWidth: 2)
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
}

#Preview {
    DiagExpectations(mess: Message(auteur: User(email: "", mdp: "", name: "", surname: "", mood: Mood(moodIcon: ""), enCeMoment: EnCeMoment(myMusic: "", myPride: "", myChallenge: "")), destinaire: User(email: "", mdp: "", name: "", surname: "", mood: Mood(moodIcon: ""), enCeMoment: EnCeMoment(myMusic: "", myPride: "", myChallenge: "")), typeQuestion: .poserQuest, message: "")
                     , hist: MessageHistorique())
}
