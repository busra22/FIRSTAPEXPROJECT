public class DmlPractice {
    public static void insertNewAccount(List<String> nameList) {
        List<Account> accList =new List<Account>();
        for(Integer i=0; i<nameList.size();i++){
            Account acc=new Account();
            acc.Name= nameList.get(i);
            accList.add(acc);
        }
        if(!accList.isEmpty()){
            Insert accList;
        }

      
    }
}