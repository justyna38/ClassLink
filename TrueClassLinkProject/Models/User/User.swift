//
//  User.swift
//  Classes
//
//  Created by Justyna Warzecha on 11/03/2024.
//

import Foundation

struct Hobby: Identifiable, Hashable {
    var id = UUID()
    var hobbyName : String
    var hobbyIcon : String
}

let hobbies: [Hobby] = [
    Hobby(hobbyName: "Films & Séries", hobbyIcon: "tv.inset.filled"),
    Hobby(hobbyName: "Dramas & Animes", hobbyIcon: "tv.inset.filled"),
    Hobby(hobbyName: "Ecouter de la musique", hobbyIcon: "headphones"),
    Hobby(hobbyName: "Jouer d’un instrument", hobbyIcon: "guitars.fill"),
    Hobby(hobbyName: "Chanter", hobbyIcon: "music.mic"),
    Hobby(hobbyName: "Dessiner", hobbyIcon: "paintpalette.fill"),
    Hobby(hobbyName: "Sortir", hobbyIcon: "figure.socialdance"),
    Hobby(hobbyName: "Sport", hobbyIcon: "figure.cooldown"),
    Hobby(hobbyName: "Danser", hobbyIcon: "figure.dance"),
    Hobby(hobbyName: "Livres & Mangas", hobbyIcon: "book.fill"),
    Hobby(hobbyName: "Cuisiner", hobbyIcon: "frying.pan.fill"),
    Hobby(hobbyName: "Jeux vidéos", hobbyIcon: "gamecontroller.fill"),
    Hobby(hobbyName: "Jeux de société", hobbyIcon: "dice.fill"),
    Hobby(hobbyName: "Réseaux Sociaux", hobbyIcon: "point.3.filled.connected.trianglepath.dotted"),
    Hobby(hobbyName: "Faire des vidéos", hobbyIcon: "person.crop.square.badge.video.fill")
]


struct Mood: Identifiable, Hashable {
    var id = UUID()
    var moodIcon: String
}

let moods: [Mood] = [
    Mood(moodIcon: "moodNone"),
    Mood(moodIcon: "moodAngel"),
    Mood(moodIcon: "moodAngry"),
    Mood(moodIcon: "moodBadass"),
    Mood(moodIcon: "moodCoffee"),
    Mood(moodIcon: "moodDemon"),
    Mood(moodIcon: "moodJaded"),
    Mood(moodIcon: "moodInLove"),
    Mood(moodIcon: "moodJoyfull"),
    Mood(moodIcon: "moodOverwhelmed"),
    Mood(moodIcon: "moodPlayfull"),
    Mood(moodIcon: "moodSick"),
    Mood(moodIcon: "moodSleepy"),
    Mood(moodIcon: "moodSmart")
]

struct EnCeMoment: Identifiable, Hashable {
    var id = UUID()
    var myMusic: String
    var myPride: String
    var myChallenge: String
}


class User: ObservableObject {
    @Published var email: String
    @Published var mdp: String
    @Published var name: String
    @Published var surname: String
    @Published var hobby: [Hobby] = []
    @Published var mood: Mood
    @Published var profilePicture: String?
    @Published var enCeMoment: EnCeMoment
    
    init(email: String, mdp: String, name: String, surname: String, mood: Mood, profilePicture: String? = nil, enCeMoment: EnCeMoment) {
        self.email = email
        self.mdp = mdp
        self.name = name
        self.surname = surname
        self.mood = mood
        self.profilePicture = profilePicture
        self.enCeMoment = enCeMoment
    }
    
    
    func addHobby(oneHobby: Hobby) -> [Hobby] {
        self.hobby.append(oneHobby)
        return hobby
    }
    
    
    func removeOne(removedHobby: Hobby) -> [Hobby] {
        if let index = hobby.firstIndex(of: removedHobby) {
            self.hobby.remove(at: index)
        }
        return hobby
    }
    func countHobby(countedHobby: [Hobby]) -> Int {
        let count = hobby.count
        return count
        
    }
    
}
