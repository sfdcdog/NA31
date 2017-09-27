public with sharing class PopupTest19 { 
List<account> accounttList = new List<account>();     
    public List<account> getAccounts()      {  
        
        accounttList = [Select Id, Name from Account LIMIT 10];  
        return accounttList ;  
    }  
  
}