/*stringDemo demo = new stringDemo();
demo.displayStringDemo();

texas demo = new texas();
demo.homework();

sampleClass demo = new sampleClass();
String FullName = demo.getFullName('Ross','Geller');
system.debug('Full Name :'+FullName);
Integer Sum = demo.getSum(10,20,30);
system.debug('Sum Value :'+Sum);
Boolean validateContains = demo.getContains('I am testing the string');
system.debug('Contains the string? :'+validateContains);

sampleClass demo = new sampleClass();
string reverseString = demo.classWork('Busra');
system.debug('Reverse String: '+ reverseString);

sampleClass demo = new sampleClass();
sampleClass demo1 = new sampleClass('Spider Man');

PlayingWithStringsDate demo= new PlayingWithStringsDate;
demo.printOutput();

EmployeeInfo demo = new EmployeeInfo();
String emploName= demo.showEmployeeInfo(004);
system.debug(emploName);

RankHandler demo = new RankHandler();
String priceRes= demo.returnPrice(15);
system.debug('Price: '+priceRes);*/

/*RankHandler demo = new RankHandler();
String priceRes= demo.returnPriceSwitch(2);
system.debug('Price: '+priceRes);*/

/*NumberRecords demo=new NumberRecords();
demo.validateNumbers(10);

NumberRecords demo=new NumberRecords();
Set<Integer> set2= new Set<Integer>();
set2.add(111);
set2.add(333);
set2.add(222);
demo.compareSets(set2);


PracticeIfElse demo = new PracticeIfElse();
system.debug('The max number is '+ demo.largestOfThreeNumbers(6,9,12));

PracticeLoopsCollections demo=new PracticeLoopsCollections();
List<Decimal> lstNums = new List<Decimal>{10.75,80.33,30.21,95.23,65.12,65.19};
system.debug('The max value in the list is '+ demo.findLargestInList(lstNums));*/


/*SoqlDemo.accountSoql1();
SoqlDemo.accountSoql2();

calculator demo= new calculator();
system.debug(demo.dynamicCalculationMethod(10,8,'addition'));*/
    

//dmlDemo.dmlDelete();
//dmlDemo.dmlupdateForLoopProject();


/*practiceDML demo= new practiceDML();
Account acc = new Account(Name='practiceAccount');
insert acc;
demo.createContacts(acc);

practiceDML demo= new practiceDML();
demo.updateOpps();

future_MixedDMLHandling demo = new future_MixedDMLHandling();
demo.createUser();

List<Lead> lList=[SELECT Id,Status FROM Lead ];
UpdateLeadStatusQueueable ld = new UpdateLeadStatusQueueable(lList);
//Execute the Queueable
system.enqueueJob(ld);*/

SalesforceProjectBatchScheduler schProj= new SalesforceProjectBatchScheduler();
String cronExp = '0 30 22 * * ? *'; // 10.30 PM
system.schedule('SFProjectBatchSchedular', cronExp, schProj);
