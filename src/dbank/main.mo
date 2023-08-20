import Float "mo:base/Float";
import Time "mo:base/Time";
import Debug "mo:base/Debug";

actor DBank {
  stable var currentValue: Float = 300;
  currentValue:=300;

  stable var startTime = Time.now();
  startTime := Time.now();
  public func topUp(amount: Float){
    currentValue += amount;
    Debug.print(debug_show(currentValue));
  };

  public func withDraw(amount: Float) {
    let tempValue: Float = currentValue - amount;
    if(tempValue > 0){
      currentValue := tempValue;
      Debug.print(debug_show(currentValue));
    }
    else{
      Debug.print("Insufficient Balance");
    }
  };

  public query func checkBalance(): async Float{
    return currentValue;
  };

  public func compound() {
    let currentTime = Time.now();
    let timeElapsed = (currentTime - startTime)/1000000000;
    Debug.print(debug_show(timeElapsed));
    currentValue := currentValue * (1.01 ** Float.fromInt(timeElapsed));
    startTime := currentTime;

  }
}
