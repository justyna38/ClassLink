//
//  DiagDifficulties.swift
//  TrueClassLinkProject
//
//  Created by Apprenant98 on 12/03/2024.
//

import SwiftUI

//struct DiagDifficulties: View {
class DifficultiesViewModel: ObservableObject {
    
    @Published var difficulties: [Difficulties] = [
        
        Difficulties(question: "Pour ce qui est d’apprendre, as-tu des difficultés?", options: [
            
            "Tout se passe bien",
            
            "J’ai des difficultés pour me concentrer",
            
            "Les cours ne sont pas adaptés à mes besoins",
            
            "J’aimerais prendre part à des projets plus concrets",
            "Je ne me sens pas aidé.e quand je suis en difficulté",
            "Autre (indique ici tes autres freins)"
            
        ]),
        
        Difficulties(question: "Comment te sens-tu par rapport aux autres ?", options: [
            
            "Je me sens isolé.e",
            
            "Je suis bien intégré.e, tout se passe bien",
            
            "Je préfère passer mon temps seul.e, mais ça se passe bien",
            
            "Je suis harcelé.e",
            
        ])
        
    ]
    
    func selectOption(questionIndex: Int, optionIndex: Int) {
        
        difficulties[questionIndex].options[optionIndex].isSelected.toggle()
        
    }
    
    @Published var shouldNavigate: Bool = false

   func validate() -> Bool {
        // ici logique de validation
        for difficulties in difficulties {
            for option in difficulties.options {
                if option.isSelected {
                    return false
                }
            }
        }
        
        shouldNavigate = true
        return true
    }
}

// Définition de la structure Difficulties
struct Difficulties {
    
    let question: String
    var options: [Option]
    
    init(question: String, options: [String]) {
        self.question = question
        self.options = options.map { Option(text: $0) }
        
    }
    
}

// Définition de la structure Option

struct option {
    
    let text: String
    var isSelected: Bool = false
    
}

// Définition de la vue principale

struct DiagDifficulties: View {
    
    @StateObject var viewModel = DifficultiesViewModel()
    @State private var selection = 2
    @State private var shouldAnimateButton = false
    var hist: MessageHistorique
    var mess: Message
    
    var body: some View {
        NavigationView {
            ZStack {
                Image("backgroundBase")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .edgesIgnoringSafeArea(.all)
                //        }
                VStack {
                    
                    Text("Tes difficultés")
                        .font(.custom("SF Pro", size: 24))
                        .fontWeight(.bold)
                        .foregroundColor(Color.orangeEdu)
                        .frame(maxWidth: .infinity, alignment: .center)
                    //                    .offset(x: 0, y: 50)
                        .padding(.top,80)
                        .padding(30)
                    
                    TabView(selection: $selection) {
                        QuestionListView(viewModel: viewModel, selection: $selection)
                            .tag(2)
                        
                        Text("Tes Motivation")
                            .tag(0)
                        Text("Tes attentes")
                            .tag(1)
                        QuestionListView(viewModel: viewModel, selection: $selection)
                            .tag(2)
                    }
                    .gesture(DragGesture().onEnded { gesture in
                        //                if gesture.translation.width > 100 && selection > 0 {
                        //                    selection -= 1
                        if gesture.translation.width < -100 && selection < 2 {
                            selection += 1 /*swipe vers la gauche*/
                        } else if gesture.translation.width > 100 && selection > 0 {
                            
                            selection -= 1 /*swipe vers la droite*/
                        }
                        
                    })
                    
                    
//                    VStack {
//                        
//                        
//                        HStack(spacing: 20) {
//                            ForEach(0..<3) { index in
//                                Circle()
//                                    .frame(width: 10, height: 10)
//                                    .foregroundColor(index == selection ? Color.orangeEdu : Color.gray)
//                                    .scaleEffect(index == selection ? 1.2 : 1.0, anchor: .center) /*selection*//* ? 1.2 : 1.0*//*, anchor: .center)*/
//                                    .animation(.easeInOut(duration: 0.5), value:selection)
//                            }
//                            
//                        }
//                        .padding(.top, 20)
//                        .offset(x: 0, y: -50)
//                    }
                     NavigationLink(
                        destination: MainView(hist: hist, mess: mess),
                        isActive: $viewModel.shouldNavigate,
                        label: {
                            Button(action: {
                                viewModel.validate()
                            }) {
                                Text("Valider")
                                    .foregroundColor(.white)
                                .font(.headline)
                                .frame(width: 100, height: 50)
                                .background(.orangeEdu)
                                .cornerRadius(16)
                            }
                        }
                    )


                }
            }
            
        }
        
    }
    // Définition de la structure QuestionListView
    
    struct QuestionListView: View {
        
        @ObservedObject var viewModel:
        DifficultiesViewModel
        @Binding var selection: Int
        
        var body: some View {
            
            ScrollView {
                VStack {
                    
                    
                    ForEach(viewModel.difficulties.indices, id: \.self) { index in
                        
                        VStack(alignment: .leading, spacing: 10) {
                            Text(viewModel.difficulties[index].question)
                                .font(.custom("SFPro-Regular", size: 18))
                                .foregroundColor(.black)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .lineLimit(2)
                                .multilineTextAlignment(.leading)
                                .frame(maxWidth: 375)
                                .offset(x:15, y: 13)
                                .padding()
                            
                            ForEach(viewModel.difficulties[index].options.indices, id: \.self) { optionIndex in
                                
                                OptionView(option: viewModel.difficulties[index].options[optionIndex], questionIndex: index, optionIndex: optionIndex, viewModel: viewModel)
                                
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
            @ObservedObject var viewModel: DifficultiesViewModel
            @State private var customText: String = ""
            
            
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
                                    .frame(width: 360, height: option.text == "Je suis harcelée.e" ? 100 : 60)
                                    .offset(x:5, y: -1)
                                
                                Text(option.text)
                                    .font(.custom("SFPro-Regular", size: 16))
                                    .foregroundColor(.black)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .lineLimit(2)
                                    .multilineTextAlignment(.leading)
                                    .frame(maxWidth: 290)
                                    .offset(x:-20, y: option.text == "Je suis harcelé.e" ? -15 : -1)
                                
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
}

#Preview {
    DiagDifficulties(hist: MessageHistorique(), mess: Message(auteur: User(email: "", mdp: "", name: "", surname: "", mood: Mood(moodIcon: ""), enCeMoment: EnCeMoment(myMusic: "", myPride: "", myChallenge: "")), destinaire: User(email: "", mdp: "", name: "", surname: "", mood: Mood(moodIcon: ""), enCeMoment: EnCeMoment(myMusic: "", myPride: "", myChallenge: "")), typeQuestion: .poserQuest, message: "")
)
}
