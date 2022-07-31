/*MapListSetPractice demo = new MapListSetPractice();
demo.partA();
demo.partB();
demo.partC();*/

/*PracticeLoopsCollections demo= new PracticeLoopsCollections();
List<Decimal> numberList= new List<Decimal> {10.75,80.33,30.21,95.23,65.12,65.19}
system.debug('The max value is: '+demo.findLargestInList(numberList));*/

List<String> listName=new List<String>{'Acc1','Acc2','Acc3','Acc4','Acc5'};
DmlPractice.insertNewAccount(listName);

/*Assignment1 assi1 = new Assignment1();
//Scenario 1
List<Account> accList = assi1.getAccounts();
system.debug('Print AccountList: '+accList);
//Scenario 2
List<Allowance__c> allowList = [Select ID,Status__c from Allowance__c];
assi1.populateAllowanceStatus(allowList);
//Scenario 3
Account acc = new Account(Name = 'AssiAccount',AccountNumber = NULL);
insert acc;
Map<ID,Account> accMap = new Map<ID,Account>();
accMap.put(acc.id,acc);
assi1.updateAccountNumbers(accMap);
//Scenario 4 - edit values in UI according to scenario
assi1.countValidContacts();
//Sceanrio 5 - edit values in UI according to scenario
assi1.populateCasePriority();*/