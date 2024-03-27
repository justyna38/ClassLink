//
//  QuestionsEleves.swift
//  TrueClassLinkProject
//
//  Created by Apprenant 46 on 20/03/2024.
//


import SwiftUI

struct QuestionsEleves: View {
    @State var numberOfWaitingMessages = 4
    @State var questionAnnael: Bool = true
    @State var questionElena: Bool = true
    @State var alertAnnael: Bool = true
    @State var alertElena: Bool = true
    @State var delayAnswerElena: Bool = false
    @State var questionMarin: Bool = true
    @State var alertMarin: Bool = false
    
    var body: some View {
        ZStack {
            Image("backgroundBase")
                .resizable()
                .ignoresSafeArea()
            VStack {
                Text("Questions en attente")
                    .font(.title)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.orangeEdu)
                    .padding(.top, 60)
                    .padding(.bottom, 50)
                
                ScrollView {
                    if questionAnnael {
                        VStack {
                                Text("Annaël Arzel")
                                    .font(.headline)
                                    .fontWeight(.semibold)
                                    .foregroundStyle(.orangeEdu)
                            ZStack {
                                Rectangle()
                                    .frame(width: 300, height: 150)
                                    .cornerRadius(16)
                                    .foregroundStyle(.lightGrayEdu)
                                VStack {
                                    Text("J'ai pas compris la différence entre communiste et bolchévik")
                                        .frame(width: 300, height: 60)
                                        .foregroundStyle(.purpleEdu)
                                    HStack {
                                        Button(action: {
                                            questionAnnael.toggle()
                                            numberOfWaitingMessages -= 1
                                        }, label: {
                                            
                                            if questionAnnael == true {
                                                ZStack {
                                                    Circle()
                                                        .frame(width: 40)
                                                        .foregroundColor(.orangeEdu)
                                                    Image(systemName: "checkmark.circle")
                                                        .resizable()
                                                        .frame(width: 30, height: 30)
                                                        .foregroundColor(.white)
                                                }
                                                .padding(.trailing, 5)
                                            } })
                                       
                                        ZStack {
                                            Circle()
                                                .frame(width: 40)
                                            .foregroundColor(.purpleEdu)
                                            Image(systemName: "hourglass.circle")
                                                .resizable()
                                                .frame(width: 30, height: 30)
                                                .foregroundColor(.white)
                                        }
                                        .padding(.trailing, 5)
                                        ZStack {
                                            Circle()
                                                .frame(width: 40)
                                            .foregroundColor(.greyEdu)
                                            Image(systemName: "xmark.circle")
                                                .resizable()
                                                .frame(width: 30, height: 30)
                                                .foregroundColor(.white)
                                        }
                                    }
                                    .padding(.top)
                                }
                            }
                            
                        }
                    } else {
                        if alertAnnael == true {
                            Button(action: {
                                alertAnnael.toggle()
                            }, label: {
                                ZStack {
                                Rectangle()
                                    .frame(width: 300, height: 150)
                                    .cornerRadius(16)
                                    .foregroundStyle(.lightGrayEdu)
                                Text("L'élève a été notifié que sa question a bien été prise en compte")
                                        .frame(width: 300, height: 60)
                                        .foregroundStyle(.purpleEdu)
                                        .multilineTextAlignment(.center)
                                }
                            })
                        }
                    }
                    
                    if questionElena {
                        VStack {
                                Text("Elena Nguyen")
                                    .font(.headline)
                                    .fontWeight(.semibold)
                                    .foregroundStyle(.orangeEdu)
                            ZStack {
                                Rectangle()
                                    .frame(width: 300, height: 150)
                                    .cornerRadius(16)
                                    .foregroundStyle(.lightGrayEdu)
                                VStack {
                                    Text("J'ai pas bien compris pourquoi j'ai eu 8 à la dernière dissert")
                                        .frame(width: 280, height: 60)
                                        .foregroundStyle(.purpleEdu)
                                        .multilineTextAlignment(.center)
                                    ZStack {
                                        HStack {
                                                    ZStack {
                                                        Circle()
                                                            .frame(width: 40)
                                                            .foregroundColor(.orangeEdu)
                                                        Image(systemName: "checkmark.circle")
                                                            .resizable()
                                                            .frame(width: 30, height: 30)
                                                            .foregroundColor(.white)
                                                    }
                                                    .padding(.trailing, 5)
                                           
                                            Button(action: {
                                                delayAnswerElena.toggle()
                                            }, label: {
                                                ZStack {
                                                    Circle()
                                                        .frame(width: 40)
                                                    .foregroundColor(.purpleEdu)
                                                    Image(systemName: "hourglass.circle")
                                                        .resizable()
                                                        .frame(width: 30, height: 30)
                                                        .foregroundColor(.white)
                                                }
                                                .padding(.trailing, 5)
                                            })
                                           
                                            ZStack {
                                                Circle()
                                                    .frame(width: 40)
                                                .foregroundColor(.greyEdu)
                                                Image(systemName: "xmark.circle")
                                                    .resizable()
                                                    .frame(width: 30, height: 30)
                                                    .foregroundColor(.white)
                                            }
                                        }
                                        .padding(.top)
                                        
                                    }
                                }
                                if delayAnswerElena {
                                    Button(action: {
                                        questionElena.toggle()
                                        numberOfWaitingMessages -= 1
                                    }, label: {
                                        VStack {
                                            Text("Je te réponds après le cours")
                                                .foregroundColor(.white)
                                                .font(.headline)
                                                .frame(width: 200, height: 50)
                                                .background(.purpleEdu)
                                                .cornerRadius(30)
                                                .multilineTextAlignment(.center)
                                            Text("On va prendre rendez-vous")
                                                .foregroundColor(.white)
                                                .font(.headline)
                                                .frame(width: 200, height: 50)
                                                .background(.purpleEdu)
                                                .cornerRadius(30)
                                                .multilineTextAlignment(.center)
                                        }
                                    })
                                    
                                }
                            }
                            
                        }
                    } else {
                        if alertElena == true {
                            Button(action: {
                                alertElena.toggle()
                            }, label: {
                                ZStack {
                                Rectangle()
                                    .frame(width: 300, height: 150)
                                    .cornerRadius(16)
                                    .foregroundStyle(.lightGrayEdu)
                                Text("L'élève a été notifié de votre réponse")
                                        .frame(width: 300, height: 60)
                                        .foregroundStyle(.purpleEdu)
                                        .multilineTextAlignment(.center)
                                }
                            })
                        }
                    }
                    
                    if questionMarin {
                        VStack {
                                Text("Marin Silva")
                                    .font(.headline)
                                    .fontWeight(.semibold)
                                    .foregroundStyle(.orangeEdu)
                            ZStack {
                                Rectangle()
                                    .frame(width: 300, height: 150)
                                    .cornerRadius(16)
                                    .foregroundStyle(.lightGrayEdu)
                                VStack {
                                    Text("ledzqsd")
                                        .frame(width: 280, height: 60)
                                        .foregroundStyle(.purpleEdu)
                                        .multilineTextAlignment(.center)
                                    ZStack {
                                        HStack {
                                                    ZStack {
                                                        Circle()
                                                            .frame(width: 40)
                                                            .foregroundColor(.orangeEdu)
                                                        Image(systemName: "checkmark.circle")
                                                            .resizable()
                                                            .frame(width: 30, height: 30)
                                                            .foregroundColor(.white)
                                                    }
                                                    .padding(.trailing, 5)
                                           
                                           
                                                ZStack {
                                                    Circle()
                                                        .frame(width: 40)
                                                    .foregroundColor(.purpleEdu)
                                                    Image(systemName: "hourglass.circle")
                                                        .resizable()
                                                        .frame(width: 30, height: 30)
                                                        .foregroundColor(.white)
                                                }
                                                .padding(.trailing, 5)
                                        
                                            Button(action: {
                                                alertMarin.toggle()
                                            }, label: {
                                                ZStack {
                                                    Circle()
                                                        .frame(width: 40)
                                                    .foregroundColor(.greyEdu)
                                                    Image(systemName: "xmark.circle")
                                                        .resizable()
                                                        .frame(width: 30, height: 30)
                                                        .foregroundColor(.white)
                                                }
                                            })
                                            
                                        }
                                        .padding(.top)
                                        
                                    }
                                }
                                if alertMarin {
                                    Button(action: {
                                        questionMarin.toggle()
                                        numberOfWaitingMessages -= 1
                                    }, label: {
                                        ZStack {
                                        Rectangle()
                                            .frame(width: 300, height: 150)
                                            .cornerRadius(16)
                                            .foregroundStyle(.lightGrayEdu)
                                        Text("L'élève a été notifié que sa question n'est pas valide")
                                                .frame(width: 300, height: 60)
                                                .foregroundStyle(.purpleEdu)
                                                .multilineTextAlignment(.center)
                                        }
                                    })
                                    
                                }
                            }
                            
                        }
                    }
                   

                    if numberOfWaitingMessages < 5 {
                        VStack {
                                Text("Bertrand DiMartino")
                                    .font(.headline)
                                    .fontWeight(.semibold)
                                    .foregroundStyle(.orangeEdu)
                            ZStack {
                                Rectangle()
                                    .frame(width: 300, height: 150)
                                    .cornerRadius(16)
                                    .foregroundStyle(.lightGrayEdu)
                                VStack {
                                    Text("Question")
                                        .frame(width: 300, height: 60)
                                        .foregroundStyle(.purpleEdu)
                                    HStack {
                                        Button(action: {
                                            questionAnnael.toggle()
                                            numberOfWaitingMessages -= 1
                                        }, label: {
                                            
                                            if questionAnnael == true {
                                                ZStack {
                                                    Circle()
                                                        .frame(width: 40)
                                                        .foregroundColor(.orangeEdu)
                                                    Image(systemName: "checkmark.circle")
                                                        .resizable()
                                                        .frame(width: 30, height: 30)
                                                        .foregroundColor(.white)
                                                }
                                                .padding(.trailing, 5)
                                            } })
                                       
                                        ZStack {
                                            Circle()
                                                .frame(width: 40)
                                            .foregroundColor(.purpleEdu)
                                            Image(systemName: "hourglass.circle")
                                                .resizable()
                                                .frame(width: 30, height: 30)
                                                .foregroundColor(.white)
                                        }
                                        .padding(.trailing, 5)
                                        ZStack {
                                            Circle()
                                                .frame(width: 40)
                                            .foregroundColor(.greyEdu)
                                            Image(systemName: "xmark.circle")
                                                .resizable()
                                                .frame(width: 30, height: 30)
                                                .foregroundColor(.white)
                                        }
                                    }
                                    .padding(.top)
                                }
                            }
                            
                        }
                    }
                    
                    if numberOfWaitingMessages < 5 {
                        VStack {
                                Text("Damien Dasilva")
                                    .font(.headline)
                                    .fontWeight(.semibold)
                                    .foregroundStyle(.orangeEdu)
                            ZStack {
                                Rectangle()
                                    .frame(width: 300, height: 150)
                                    .cornerRadius(16)
                                    .foregroundStyle(.lightGrayEdu)
                                VStack {
                                    Text("Question")
                                        .frame(width: 300, height: 60)
                                        .foregroundStyle(.purpleEdu)
                                    HStack {
                                        Button(action: {
                                            questionAnnael.toggle()
                                            numberOfWaitingMessages -= 1
                                        }, label: {
                                            
                                            if questionAnnael == true {
                                                ZStack {
                                                    Circle()
                                                        .frame(width: 40)
                                                        .foregroundColor(.orangeEdu)
                                                    Image(systemName: "checkmark.circle")
                                                        .resizable()
                                                        .frame(width: 30, height: 30)
                                                        .foregroundColor(.white)
                                                }
                                                .padding(.trailing, 5)
                                            } })
                                       
                                        ZStack {
                                            Circle()
                                                .frame(width: 40)
                                            .foregroundColor(.purpleEdu)
                                            Image(systemName: "hourglass.circle")
                                                .resizable()
                                                .frame(width: 30, height: 30)
                                                .foregroundColor(.white)
                                        }
                                        .padding(.trailing, 5)
                                        ZStack {
                                            Circle()
                                                .frame(width: 40)
                                            .foregroundColor(.greyEdu)
                                            Image(systemName: "xmark.circle")
                                                .resizable()
                                                .frame(width: 30, height: 30)
                                                .foregroundColor(.white)
                                        }
                                    }
                                    .padding(.top)
                                }
                            }
                            
                        }
                    }
                    
                    if questionAnnael == false {
                        VStack {
                                Text("Sarah Dubois")
                                    .font(.headline)
                                    .fontWeight(.semibold)
                                    .foregroundStyle(.orangeEdu)
                            ZStack {
                                Rectangle()
                                    .frame(width: 300, height: 150)
                                    .cornerRadius(16)
                                    .foregroundStyle(.lightGrayEdu)
                                VStack {
                                    Text("Question")
                                        .frame(width: 300, height: 60)
                                        .foregroundStyle(.purpleEdu)
                                    HStack {
                                        Button(action: {
                                            questionAnnael.toggle()
                                            numberOfWaitingMessages -= 1
                                        }, label: {
                                            
                                            if questionAnnael == true {
                                                ZStack {
                                                    Circle()
                                                        .frame(width: 40)
                                                        .foregroundColor(.orangeEdu)
                                                    Image(systemName: "checkmark.circle")
                                                        .resizable()
                                                        .frame(width: 30, height: 30)
                                                        .foregroundColor(.white)
                                                }
                                                .padding(.trailing, 5)
                                            } })
                                       
                                        ZStack {
                                            Circle()
                                                .frame(width: 40)
                                            .foregroundColor(.purpleEdu)
                                            Image(systemName: "hourglass.circle")
                                                .resizable()
                                                .frame(width: 30, height: 30)
                                                .foregroundColor(.white)
                                        }
                                        .padding(.trailing, 5)
                                        ZStack {
                                            Circle()
                                                .frame(width: 40)
                                            .foregroundColor(.greyEdu)
                                            Image(systemName: "xmark.circle")
                                                .resizable()
                                                .frame(width: 30, height: 30)
                                                .foregroundColor(.white)
                                        }
                                    }
                                    .padding(.top)
                                }
                            }
                            
                        }
                    }

                    if questionElena == false {
                        VStack {
                                Text("Nadia Farelli")
                                    .font(.headline)
                                    .fontWeight(.semibold)
                                    .foregroundStyle(.orangeEdu)
                            ZStack {
                                Rectangle()
                                    .frame(width: 300, height: 150)
                                    .cornerRadius(16)
                                    .foregroundStyle(.lightGrayEdu)
                                VStack {
                                    Text("Question")
                                        .frame(width: 300, height: 60)
                                        .foregroundStyle(.purpleEdu)
                                    HStack {
                                        Button(action: {
                                            questionAnnael.toggle()
                                            numberOfWaitingMessages -= 1
                                        }, label: {
                                            
                                            if questionAnnael == true {
                                                ZStack {
                                                    Circle()
                                                        .frame(width: 40)
                                                        .foregroundColor(.orangeEdu)
                                                    Image(systemName: "checkmark.circle")
                                                        .resizable()
                                                        .frame(width: 30, height: 30)
                                                        .foregroundColor(.white)
                                                }
                                                .padding(.trailing, 5)
                                            } })
                                       
                                        ZStack {
                                            Circle()
                                                .frame(width: 40)
                                            .foregroundColor(.purpleEdu)
                                            Image(systemName: "hourglass.circle")
                                                .resizable()
                                                .frame(width: 30, height: 30)
                                                .foregroundColor(.white)
                                        }
                                        .padding(.trailing, 5)
                                        ZStack {
                                            Circle()
                                                .frame(width: 40)
                                            .foregroundColor(.greyEdu)
                                            Image(systemName: "xmark.circle")
                                                .resizable()
                                                .frame(width: 30, height: 30)
                                                .foregroundColor(.white)
                                        }
                                    }
                                    .padding(.top)
                                }
                            }
                            
                        }
                    }
                    
                    if questionMarin == false {
                        VStack {
                                Text("Maëlys Fernandez")
                                    .font(.headline)
                                    .fontWeight(.semibold)
                                    .foregroundStyle(.orangeEdu)
                            ZStack {
                                Rectangle()
                                    .frame(width: 300, height: 150)
                                    .cornerRadius(16)
                                    .foregroundStyle(.lightGrayEdu)
                                VStack {
                                    Text("Question")
                                        .frame(width: 300, height: 60)
                                        .foregroundStyle(.purpleEdu)
                                    HStack {
                                        Button(action: {
                                            questionAnnael.toggle()
                                            numberOfWaitingMessages -= 1
                                        }, label: {
                                            
                                            if questionAnnael == true {
                                                ZStack {
                                                    Circle()
                                                        .frame(width: 40)
                                                        .foregroundColor(.orangeEdu)
                                                    Image(systemName: "checkmark.circle")
                                                        .resizable()
                                                        .frame(width: 30, height: 30)
                                                        .foregroundColor(.white)
                                                }
                                                .padding(.trailing, 5)
                                            } })
                                       
                                        ZStack {
                                            Circle()
                                                .frame(width: 40)
                                            .foregroundColor(.purpleEdu)
                                            Image(systemName: "hourglass.circle")
                                                .resizable()
                                                .frame(width: 30, height: 30)
                                                .foregroundColor(.white)
                                        }
                                        .padding(.trailing, 5)
                                        ZStack {
                                            Circle()
                                                .frame(width: 40)
                                            .foregroundColor(.greyEdu)
                                            Image(systemName: "xmark.circle")
                                                .resizable()
                                                .frame(width: 30, height: 30)
                                                .foregroundColor(.white)
                                        }
                                    }
                                    .padding(.top)
                                }
                            }
                            
                        }
                    }
                    
                }
                
                Text("\(numberOfWaitingMessages) autres questions en attente")
                    .foregroundColor(.white)
                    .font(.headline)
                    .frame(width: 200, height: 50)
                    .background(.orangeEdu)
                    .cornerRadius(30)
                    .multilineTextAlignment(.center)
                
                Spacer()
            }
            
            
        }
    }
}

#Preview {
    QuestionsEleves(numberOfWaitingMessages: 4, questionAnnael: true, questionElena: true, alertAnnael: true, alertElena: true, delayAnswerElena: false, questionMarin: true, alertMarin: false)
}
