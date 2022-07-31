public class RankHandler {
    //Rank 1-Gold
    //Rank 2-Silver
    //Rank 3-Bronz
    //Rank 4-10 - Honorable Mention
    //Rank>10 -Participation Certificate

    public String returnPrice(Integer rank) {
        String price='';
        if(rank==1){
            price='Gold';
        }else if(rank==2){
            price='Silver';
        }else if(rank==3){
            price='Bronze';
        }else if(rank>=4 && rank<=10){
            price='Honorable Mention';
        }else{
            price='Participation Certificate';
        }
        return price;

    }

    public String returnPriceSwitch(Integer rank){
        String price='';
        switch on rank{
            when  1{
                price='Gold';
            }
            when 2{
                price='Silver'; 
            }
            when 3{
                price='Bronze';
            }
            when 4,5,6,7,8,9,10{
                price='Honorable mention';
            }
            when else{
                price='Participation Certificate';
            }
        }
        return price;

    }
}