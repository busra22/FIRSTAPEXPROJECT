public class CustomSettingDemo {
    public static void customSettingsDemoMethod(){
        //List Custom Settings
        Map<String,Country_Code_cs__c> counCodeMap= Country_Code_cs__c.getAll();
        system.debug('Custom Settings List Type: '+ counCodeMap);
        for(Country_Code_cs__c cs: Country_Code_cs__c.getAll().values()){
            system.debug('Each code:'+ cs.Country_Code__c);
        }
        //Hierarchy Custom settings
        Golds_Gym_Membership__c gm1= Golds_Gym_Membership__c.getOrgDefaults();
        //Parameters-user Id /ProfileId
        Golds_Gym_Membership__c gm2=Golds_Gym_Membership__c.getInstance(userInfo.getUserId());
        Golds_Gym_Membership__c gm3=Golds_Gym_Membership__c.getInstance('00e8b000002JEUL');
        system.debug(gm1);
        system.debug(gm2);
        system.debug(gm3);
        
	}
}