import UIKit

var ages:[Int] = [20,53,34]

ages.sort()

if let  oldestAge = ages.last{
    print("the oldes age is \(oldestAge)")
}else{
    print("there is not oldest age ")
}


//let oldestAge = ages.last ?? 999

func getOldestAge(){
    guard let oldestAge = ages.last else{
        return
    }
    print("\(oldestAge) is the oldest age")
}
getOldestAge()
