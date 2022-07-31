public class PracticeIfElse {
    public Integer largestOfThreeNumbers(Integer x, Integer y,Integer z) {
        if(x>y && x>z){
            return x;
        }else if(y>z && y>x){
            return y;
        }else{
            return z;
        }
    }
}