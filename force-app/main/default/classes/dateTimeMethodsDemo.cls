public class dateTimeMethodsDemo {

    public void calculateAgeInMonths(){
       Date birthDate= Date.newInstance(2003, 8, 2);
       Date todayDate= Date.today();
       Integer ageInMonths= birthDate.monthsBetween(todayDate);
       system.debug('Age in months: '+ ageInMonths);
    }
    
    public void calculateAgeInDays(){
        Date birthDate= Date.newInstance(2003, 8, 2);
        Date todayDate= Date.today();
        Integer ageInDays= birthDate.daysBetween(todayDate);
        system.debug('Age in months: '+ ageInDays);
    }
    
    public void printSubscriptionEndDate(){
        Date subscriptionStartDate= Date.today();
        Date subscriptionEndDate= subscriptionStartDate.addDays(1000);
        system.debug('Start Date: '+ subscriptionStartDate);
        system.debug('End Date: '+ subscriptionEndDate);
        Integer yearEnd = subscriptionEndDate.year();
        Integer monthEnd = subscriptionEndDate.month();
        system.debug('End Year: '+yearEnd+ 'End Month: ' + monthEnd);
        
    }
    
    public void printOfferEndDateTime(){
       DateTime offerStart = DateTime.now();
       DateTime offerEnd = offerStart.addHours(51);
       System.debug('Offer Start Date'+ offerStart);
       System.debug('Offer Start Date'+ offerEnd);
    }
    
    public void printNoOfRemainingDays(){
        Date subscriptionStartDate= Date.newInstance(2021, 06, 15);
        Date subscriptionEndDate= subscriptionStartDate.addYears(1);
        Date todayDate= Date.today();
        Integer expirationDate= todayDate.daysBetween(subscriptionEndDate);
        system.debug('Start Date: '+subscriptionStartDate);
        system.debug('End Date: '+subscriptionEndDate);
        system.debug('Expriration Date: '+ expirationDate);
     
    }
    
    
}