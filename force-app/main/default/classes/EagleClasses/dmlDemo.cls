public with sharing class dmlDemo {
    public static void dml1() {
        Account acc=new Account();
        acc.Name= 'DMLTest';
        acc.Rating= 'Hot';
        Insert acc;

        acc.AccountSource= 'Web';
        Update acc;
    }

    public static void dmlCustom(){
        Salesforce_Project__c prj = new Salesforce_Project__c();
        prj.Project_Name__c='TestingFromApex';
        Insert prj;
        prj.Status__c='Completed';
        prj.Description__c='This is description';
        Update prj;
    }

    public static void dmlSOQL(){
        Salesforce_Project__c prj =[SELECT Status__c,Project_Name__c FROM Salesforce_Project__c WHERE Project_Name__c='TestingFromApex' WITH SECURITY_ENFORCED Limit 1 ];
        prj.Status__c='In-progress';
        Update prj;
    }

    public static void dmlConwithAcc(){
        Account acc=new Account();
        acc.Name= 'AccForRelationship';
        Insert acc;
        Contact con = new Contact();
        con.FirstName= 'Shah Ruk';
        con.LastName= 'Khan';
        con.AccountId = acc.Id;
        Insert con;


    }

    public static void dmlTicketwithProject(){
        Salesforce_Project__c proj = [SELECT Status__c,Project_Name__c FROM Salesforce_Project__c WHERE Project_Name__c= 'MVP6' WITH SECURITY_ENFORCED LIMIT 1];
        Salesforce_Ticket__c ticket = new Salesforce_Ticket__c();
        ticket.Subject__c = 'TicketFromApex';
        ticket.Status__c= 'In development';
        ticket.Salesforce_Project__c = proj.Id;
        Insert ticket;
        
    }

    public static void dmlWithMoreAccounts(){
        List<Account> accList =new List<Account>();
        Account acc1 =new Account();
        acc1.Name = 'TestAccount1';
        accList.add(acc1);
        Account acc2 =new Account();
        acc2.Name = 'TestAccount1';
        accList.add(acc2);
        Account acc3 =new Account();
        acc3.Name = 'TestAccount1';
        accList.add(acc3);
        Insert accList;
    }

    public static void dmlWithMoreAccountsForLoop(){
        List<Account> accList =new List<Account>();
        for(Integer i=0;i<100;i++){
            Account acc = new Account();
            acc.Name= 'ApexAccount'+i;
            accList.add(acc);
        }
        if(!accList.isEmpty()){
            Insert accList;

        }
    }

    public static void dmlDelete(){
        List<Account> accListToDelete =[SELECT Name FROM Account WHERE Name LIKE '%ApexAccount%' WITH SECURITY_ENFORCED];
        Delete accListToDelete;
    }

    public static void dmlupdateForLoopProject(){
        List<Salesforce_Project__c> projList =[SELECT Name, Description__c FROM Salesforce_Project__c WITH SECURITY_ENFORCED];
        for(Salesforce_Project__c proj: projList){
            proj.Description__c='This is from Apex';
        }

        if(!projList.isEmpty()){
            Update projList;
        }
    }

    public static void dmlDatabaseMethods(){
        List<Account> accList = new List<Account>();
        Account acc1 = new Account(Name = 'DatabaseInsertAccount');
        Account acc2 = new Account(Name = '');
        accList.add(acc1);
        accList.add(acc2);
        insert accList; //Errored
        Database.insert(accList, false); //partial insert 
    }
    public static void upsertDemo(){
        //Insert + Update
        List<Salesforce_Project__c> projList = new List<Salesforce_Project__c>();
        //Creating
        Salesforce_Project__c proj = new Salesforce_Project__c();
        proj.Project_Name__c = 'upsertTesting';              
        projList.add(proj);
        //Updating
        Salesforce_Project__c projUpdate = [SELECT Name FROM Salesforce_Project__c WITH SECURITY_ENFORCED LIMIT 1];
        projUpdate.Project_Name__c = 'upsertTestingUpdate';         
        projList.add(projUpdate);
        upsert projList;
    }
}