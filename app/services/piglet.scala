package services 

class Piglet(){
  var c:Int = 0
  def hello:String = "I'm a piggy"
  def count():String = {
    c = c + 1
    return c.toString
  }
}
