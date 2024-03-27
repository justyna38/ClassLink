// Connexion.swift

import SwiftUI

/// A view for user login.
struct Connexion: View {
    
    @ObservedObject var user = User(email: "", mdp: "", name: "Temp", surname: "Temp", mood: Mood(moodIcon: "moodNone"), enCeMoment: EnCeMoment(myMusic: "", myPride: "", myChallenge: ""))
    @ObservedObject var eleveList: EleveList // Ajoutez cette ligne
    
    @State private var navigate = false
    @State private var showingAlert = false
    
    var hist: MessageHistorique
    var mess: Message
    
    var body: some View {
        NavigationStack {
            ZStack{
                Image("backgroundBase")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .ignoresSafeArea(.all)
                
                VStack{
                    HStack{
                        Text("Connexion")
                            .font(.title)
                            .padding(.top, 70)
                            .padding(.leading)
                            .offset(x:-100, y:30)
                    }
                    Spacer()
                    Spacer()
                    VStack{
                        TextFieldView(text: $user.email, title: "mail")
                        SecureFieldView(text: $user.mdp, title: "password")
                        CustomButton2(text: "Connexion", width: 150, height: 50, cornerRadius: 30, action:
                                        {
                            if validateCredentials() {
                                // Trigger navigation
                                self.navigate = true
                            } else {
                                // Show an alert
                                self.showingAlert = true
                            }
                        }
                        )
                        .alert(isPresented: $showingAlert) {
                            Alert(title: Text("Erreur"), message: Text("Veuillez entrer un email et un mot de passe valides"), dismissButton: .default(Text("OK")))
                        }
                        .padding()
                        .navigationDestination(isPresented: $navigate, destination: {
                            MainView(hist: hist, mess: mess)})
                        
                    }
                    Spacer()
                    Spacer()
                    HStack{
                        Text("Mot de passe oublié ?")
                            .offset(x:90, y:-25)
                            .foregroundStyle(.greyEdu)
                    }
                    .padding()
                }
            }
        }
    }
    
    /// Validates the user's email and password.
    /// - Returns: A boolean value indicating whether the credentials are valid or not.
    func validateCredentials() -> Bool {
        print(eleveList.listeEleve)
        return eleveList.eleveExists(email: user.email, mdp: user.mdp)
    }
}

#Preview {
    Connexion(eleveList: EleveList(), hist: MessageHistorique(), mess: Message(auteur: User(email: "", mdp: "", name: "", surname: "", mood: Mood(moodIcon: ""), enCeMoment: EnCeMoment(myMusic: "", myPride: "", myChallenge: "")), destinaire: User(email: "", mdp: "", name: "", surname: "", mood: Mood(moodIcon: ""), enCeMoment: EnCeMoment(myMusic: "", myPride: "", myChallenge: "")), typeQuestion: .poserQuest, message: ""))
}

