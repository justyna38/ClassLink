//
//  Inscription.swift
//  TrueClassLinkProject
//
//  Created by Apprenant98 on 12/03/2024.
//

import SwiftUI

struct Inscription: View {
    
    @State private var name: String = ""
    @State private var surname: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var selectedClass: Classes?
    @State private var selectedClassIndex = 0
    var eleveList = EleveList()
    @State private var isModalVisible = false
    @State private var navigateToConnexion = false
    @State private var fillAllFieldsError = false
    @State private var navigateToDiagDescription = false
    
    
    func saveAction() {
        guard let classe = selectedClass else { return }
        
        if name.isEmpty || surname.isEmpty || email.isEmpty || password.isEmpty {
            fillAllFieldsError = true
            return
        }
        
        if (eleveList.creerEleve(email: email, mdp: password, name: name, surname: surname, classe: classe) != nil) {
            navigateToDiagDescription = true
        } else {
            if (eleveList.creerEleve(email: email, mdp: password, name: name, surname: surname, classe: classe) != nil) {
                navigateToConnexion = true
            }
        }
    }
    
    
    
    @ObservedObject var listeClasses = ListeClasses()
    
    //       init() {
    //           self.listeClasses = listeClasses
    //           self.listeClasses.addClass(className: "2nd1")
    //           self.listeClasses.addClass(className: "2nd2")
    //           self.listeClasses.addClass(className: "2nd3")
    //           self.listeClasses.addClass(className: "1er1")
    //           self.listeClasses.addClass(className: "1er2")
    //           self.listeClasses.addClass(className: "1er3")
    //           self.listeClasses.addClass(className: "Ter1")
    //           self.listeClasses.addClass(className: "Ter2")
    //           self.listeClasses.addClass(className: "Ter3")
    //       }
    
    
    var arrayTitle: [String] = ["Nom", "Prenom", "Mail", "Mot de passe"]
    @State private var emailExistsError = false
    
    var hist: MessageHistorique
    
    var mess: Message
    
    var body: some View {
        NavigationStack{
            ZStack{
                Image("backgroundBase")
                    .resizable()
                    .ignoresSafeArea()
                VStack {
                    ForEach(arrayTitle, id: \.self){ title in
                        if title == "Mot de passe" {
                            SecureFieldView(text: textForTitle(title), title: title)
                        } else {
                            TextFieldView(text: textForTitle(title), title: title)
                        }
                    }
                    
                    Button(action: {
                        isModalVisible.toggle()
                    }) {
                        Text(selectedClass?.name ?? "Classe")
                            .foregroundColor(selectedClass != nil ? .black : .gray)
                            .padding(.trailing, 270)
                            .padding(.bottom, 5)
                            .overlay(
                                Rectangle()
                                    .frame(width: 340, height: 1)
                                    .padding(.horizontal)
                                    .foregroundColor(.gray), // Change the color as needed
                                alignment: .bottom
                            )
                    }
                    .sheet(isPresented: $isModalVisible) {
                        ModalPicker(selectedClassIndex: $selectedClassIndex, listeClasses: listeClasses, selectedClass: $selectedClass)                             }
                    
                    //Spacer()
                    
                    .padding()
                    
                    Button(action: {
                        
                        saveAction()
                    }, label: {
                        Text("Enregistrer")
                            .foregroundColor(.white)
                            .font(.headline)
                            .frame(width: 200, height: 50)
                            .background(.orangeEdu)
                            .cornerRadius(30)
                    })
                    
                    if fillAllFieldsError {
                        Text("Veuillez remplir tous les champs.")
                            .foregroundColor(.red)
                            .padding()
                    }
                    
                    else if emailExistsError {
                        Text("L'adresse e-mail existe déjà dans la base.")
                            .foregroundColor(.red)
                            .padding()
                    }
                    
                }
            }
            .navigationTitle("Inscription")
            .navigationBarHidden(navigateToConnexion) // Masquer la barre de navigation si nous naviguons vers la page de connexion
            .background(
                NavigationLink(
                    destination: DiagDescription(hist: hist, mess: mess), // Remplacez Connexion par DiagDescription
                    isActive: $navigateToDiagDescription,
                    label: {
                        EmptyView()
                    })
            )
            .onAppear {
                emailExistsError = false
                fillAllFieldsError = false
            }
        }
    }
    
    func textForTitle(_ title: String) -> Binding<String> {
        switch title {
        case "Nom":
            return $name
        case "Prenom":
            return $surname
        case "Mail":
            return $email
        case "Mot de passe":
            return $password
        default:
            return .constant("") // Default binding
        }
    }
}


#Preview {
    Inscription(hist: MessageHistorique(), mess: Message(auteur: User(email: "", mdp: "", name: "", surname: "", mood: Mood(moodIcon: ""), enCeMoment: EnCeMoment(myMusic: "", myPride: "", myChallenge: "")), destinaire: User(email: "", mdp: "", name: "", surname: "", mood: Mood(moodIcon: ""), enCeMoment: EnCeMoment(myMusic: "", myPride: "", myChallenge: "")), typeQuestion: .poserQuest, message: ""))
}

struct ModalPicker: View {
    @Environment(\.presentationMode) var presentationMode
    @Binding var selectedClassIndex: Int
    var listeClasses: ListeClasses
    @Binding var selectedClass: Classes?
    
    var body: some View {
        NavigationView {
            VStack {
                Picker(selection: $selectedClassIndex, label: Text("")) {
                    ForEach(listeClasses.classes.indices, id: \.self) { index in
                        Text(self.listeClasses.classes[index].name).tag(index)
                    }
                }
                
                .pickerStyle(WheelPickerStyle())
                .padding()
            }
            .navigationBarTitle("Choisir une classe")
            .navigationBarItems(trailing: Button("Fermer") {
                selectedClass = listeClasses.classes[selectedClassIndex]
                presentationMode.wrappedValue.dismiss()
            })
        }
    }
}
