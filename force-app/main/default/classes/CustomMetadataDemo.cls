public class CustomMetadataDemo {
    public static void customMetadataDemoMethod(){
        //SOQL
        List<Country_Code_cm__mdt> cusMetadataList=[SELECT Id,MasterLabel,DeveloperName,Country_Code__c,Telephone_Code__c FROM Country_Code_cm__mdt];
        system.debug('(SOQL cm:'+cusMetadataList );
        //Map
        Map<String,Country_Code_cm__mdt> cusMetadataMap= Country_Code_cm__mdt.getAll();
        system.debug('(SOQL cm:'+cusMetadataMap );
    }
}