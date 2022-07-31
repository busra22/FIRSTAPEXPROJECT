public class PracticeLoopsCollections {
    public Decimal findLargestInList(List<Decimal> numList){
        Decimal maxVal=0;
        for(Integer i=0; i<numList.size(); i++){
            if(numList[i]>maxVal){
                maxVal= numList[i];
            }

        }
        return maxVal;

    }

    public static void findValuesInMap(){
        Map<String,Decimal> currISOCodeAndExchangeRateMap= new Map<String,Decimal>();
        currISOCodeAndExchangeRateMap.put('AUD',0.73);
        currISOCodeAndExchangeRateMap.put('CAD',0.78);
        currISOCodeAndExchangeRateMap.put('EUR',1.13);
        currISOCodeAndExchangeRateMap.put('NZD',0.68);
        currISOCodeAndExchangeRateMap.put('INR',0.013);
        currISOCodeAndExchangeRateMap.put('SAD',1.56);

        Boolean containsSAD = currISOCodeAndExchangeRateMap.containsKey('SAD');
        system.debug('contain SAD? '+ containsSAD);

        Set<String> rateMoreThnOne= new Set<String>();
        Set<String> rateLessThnOne= new Set<String>();

        for(String codes : currISOCodeAndExchangeRateMap.keyset()){
            if (currISOCodeAndExchangeRateMap.get(codes) >=1){
                rateMoreThnOne.add(codes);
            }else{
                rateLessThnOne.add(codes);
            }
        }

        system.debug('Iso for the Rates more than 1 '+ rateMoreThnOne);
        system.debug('Iso for the Rates less than 1 '+ rateLessThnOne);
    }

    public static void getUniqueValues(List<String> fruitsList){
        Set<String> fruitsSet= new Set<String>(fruitsList);
        system.debug(fruitsSet);
    }

    public static void oppLi(String stageValue,String leadSource){
       
        List<Opportunity> oppList = [SELECT LeadSource,StageName FROM Opportunity WHERE LeadSource=:leadSource AND StageName=:stageValue];
        system.debug('Opportunity List: '+oppList);
    }
}