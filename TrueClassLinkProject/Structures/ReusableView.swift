import SwiftUI

/// A custom button view.
// CustomButton.swift

struct CustomButton<Destination: View>: View {
    let text: String
    let width: CGFloat
    let height: CGFloat
    let cornerRadius: CGFloat
    let destination: Destination
    
    var body: some View {
        NavigationLink(destination: destination){
            Text(text)
                .foregroundColor(.white)
                .font(.headline)
                .frame(width: width, height: height)
                .background(.orangeEdu)
                .cornerRadius(cornerRadius)
        }
    }
}

struct CustomButton2: View {
    let text: String
    let width: CGFloat
    let height: CGFloat
    let cornerRadius: CGFloat
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(text)
                .foregroundColor(.white)
                .font(.headline)
                .frame(width: width, height: height)
                .background(Color.orangeEdu)
                .cornerRadius(cornerRadius)
        }
    }
}

/// A tab view bar.
struct tabViewBar: View {
    var hist: MessageHistorique
    var message: Message
    var body: some View {
        TabView {
            CourseChoice(hist: hist)
                .tabItem {Label("Accueil", systemImage: "house")}
            QuestionClass(message: message, hist: hist)
                .tabItem {Label("Questions", systemImage: "bell")}
            Profile()
                .tabItem {Label("Profile", systemImage: "gear")
                    Tendances()
                        .tabItem { Label("Tendances", systemImage: "flame") }
                }
        }
    }
}

/// A big orange button with text and an image.
struct OrangeBigButton: View {
    let text: String
    let imageName: String
    
    func xOffsetForText() -> CGFloat {
        if text.count < 8 {
            return 40
        } else if text.count < 15 {
            return 20 // Ajoutez ou ajustez les conditions selon vos besoins
        } else {
            return 8
        }
    }
    var body: some View {
        
        ZStack {
            Rectangle()
                .frame(width: 150, height: 120)
                .foregroundColor(.orangeEdu)
                .clipShape(RoundedRectangle(cornerRadius: 16.0))
                .overlay(
                    RoundedRectangle(cornerRadius: 16.0)
                        .stroke(Color.orangeEdu, lineWidth: 2)
                )
            
            VStack {
                Rectangle()
                    .frame(width: 75, height: 40)
                    .foregroundColor(.yellowEdu)
                    .clipShape(.rect(topLeadingRadius: 0, bottomLeadingRadius: 16, bottomTrailingRadius: 0, topTrailingRadius: 16))
                    .offset(x: 38, y: -10)
                
                Image(systemName: imageName)
                    .resizable()
                    .frame(width: 25, height: 25)
                    .offset(x: -40)
                    .foregroundColor(.white)
                
                
                Text(text)
                    .foregroundColor(.white)
                    .offset(x: xOffsetForText())
            }
        }
    }
}

/// A non-filled orange button with text and an image.
struct NonFilledOrangeButton: View {
    let text: String
    let imageButton: Image
    
    var body: some View {
        
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.orangeEdu, lineWidth: 2)
                .frame(width: 285,height: 85)
            
            HStack {
                Text(text)
                    .foregroundColor(.orangeEdu)
                    .padding(.leading, 8)
                imageButton
                    .resizable()
                    .frame(width: 25, height: 25)
            }
        }
    }
}


/// A button with a question and an answer.
struct ButtonAnswer: View {
    let question: String
    let answer: String
    
    var body: some View {
        Button(action: {
        }) {
            ZStack {
                RoundedRectangle(cornerRadius: 15.0)
                    .frame(width: 330, height: 220)
                    .foregroundStyle(.greyEdu)
                    .opacity(0.2)
                
                VStack {
                    Text(question)
                    Text(answer)
                }
            }
        }
    }
}

/// A rectangular togglable button.
struct RectangularTogglableButton: View {
    @State private var isClicked = false
    let buttonText: String
    
    var body: some View {
        Button(action: {
            isClicked.toggle()
        }) {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.orangeEdu, lineWidth: 2)
                    .frame(width: 200, height: 50)
                    .overlay(HStack{
                        Text(buttonText)
                            .foregroundStyle(.orangeEdu)
                        Spacer()
                        Circle()
                            .fill(isClicked ? .orangeEdu : .clear)
                            .fill(isClicked ? Color.orangeEdu : Color.clear)
                            .overlay(Circle().stroke(Color.orangeEdu, lineWidth: 2))
                            .frame(width: 30, height: 30)
                    }
                        .padding(.horizontal)
                    )
            }
        }
    }
}

//textfields for writing in it
struct TextFieldView: View {
    @Binding var text: String
    var title: String
    var body: some View {
        VStack{
            TextField(title, text: $text)
                .padding(.horizontal)
                .padding(.bottom, 8)
                .overlay(
                    Rectangle()
                        .frame(height: 1)
                        .padding(.horizontal)
                        .foregroundColor(.greyEdu),
                    alignment: .bottom
                )
        }
        .padding()
    }
}

struct SecureFieldView: View {
    @Binding var text: String
    var title: String
    var body: some View {
        VStack{
            SecureField(title, text: $text)
                .padding(.horizontal)
                .padding(.bottom, 8)
                .overlay(
                    Rectangle()
                        .frame(height: 1)
                        .padding(.horizontal)
                        .foregroundColor(.greyEdu),
                    alignment: .bottom
                )
        }
        .padding()
    }
}

/// The main content view.

struct ReusableView: View {
    var body: some View {
        NavigationStack{
            VStack(spacing: 20) {
                CustomButton(text: "Connexion", width: 350, height: 50, cornerRadius: 30, destination: ReusableView())
                
                OrangeBigButton(text: "Physique-Chimie", imageName: "book")
                NonFilledOrangeButton(text: "Historique", imageButton: Image(systemName: "star"))
                ButtonAnswer(question: "la question", answer: "la réponse")
                RectangularTogglableButton(buttonText: "lol")
            }
        }
    }
}

#Preview {
    ReusableView()
}
