import SwiftUI

struct AnnaelStudentProfileView: View {
    @State var profileEditMode: Bool
    @State var profilePictureExists: Bool
    @ObservedObject var eleve: Eleve
    @State var showingAlert: Bool
    
    var ownProfile: Bool = true
    
    var body: some View {
        
        
        VStack(alignment: .center) {
            HStack {
                Spacer()
                ProfilePicture(profileEditMode: $profileEditMode, profilePictureExists: $profilePictureExists)
                ProfileText()
                    .padding(.leading, 10)
                if ownProfile == true {
                    ProfileEditButton(profileEditMode: $profileEditMode)
                        .padding(.leading, 35)
                    Spacer()
                } else {
                    DMButton()
                        .padding(.leading, 35)
                    Spacer()
                }
            } //Tête de profil
            .padding(.vertical, 30)
            
            Text("Loisirs")
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundStyle(.orangeEdu)
                .multilineTextAlignment(.leading)
                .padding(.bottom, -5)
            
            ProfileHobbiesRectangle(profileEditMode: $profileEditMode, eleve: eleve)
            
            Text("En ce moment")
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundStyle(.orangeEdu)
                .multilineTextAlignment(.leading)
                .padding(.bottom, -5)
                .padding(.top, 20)
            ProfileLatelyRectangleView(profileEditMode: $profileEditMode, eleve: eleve, showingAlert: showingAlert)
            MoodView(profileEditMode: $profileEditMode, eleve: eleve, showingMoodsList: false)
            Spacer()
        }
        
        
    }
    
}





struct AnnaelStudentProfileView_Preview : PreviewProvider {
    static var previews: some View {
        AnnaelStudentProfileView(profileEditMode: true, profilePictureExists: true, eleve: studentProfiles[0], showingAlert: false)
    }
}
