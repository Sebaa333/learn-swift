import UIKit


enum Phone:String{
    case Iphone11pro    = "esta va ser mi prox telefono"
    case iphoneSe       = "I dislike this phone size.It makes design hard"
    case pixel          = "can't be broken .Classic "
    case nokia          = "this is a nokia"
}

func getSeanOpinion(on phone:Phone){
    switch phone {
    case .Iphone11pro:
        print( "esta va ser mi prox telefono")
    case .iphoneSe:
        print("I dislike this phone size.It makes design hard")
    case .nokia:
        print("this is a nokia")
    case .pixel:
        print("can't be broken .Classic ")
    }
    
    
    
    
//    print(phone.rawValue)
    
}
getSeanOpinion(on: .pixel)


let matchmakingRank = 150

func determinatePlayerLeague(from rank: Int){
    switch rank {
    case 0:
        print("juga una partida para saber tu rango")
    case 1..<50:
        print("sos de bronce")
    case 50..<100:
        print("sos un silver")
    case 100..<200:
        print("gold")
    default:
        print("este es un mensaje default")
    }
    
}

determinatePlayerLeague(from: matchmakingRank)





