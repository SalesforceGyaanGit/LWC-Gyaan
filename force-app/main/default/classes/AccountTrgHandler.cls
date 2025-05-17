public class AccountTrgHandler {
    public static void preventDeletion(List<Account> lstAccount)
    {
        set<Id> idset = new set<Id>();
        for(Account a: lstAccount)
        {
           idset.add(a.Id);
        }
        List<contact> accountToDeletelst = new List<contact>([SELECT Id from contact where AccountId =:idset]);
        
        system.debug('size of contacts == '+accountToDeletelst.size());
        for(Account a: lstAccount)
        {
        	if(accountToDeletelst.size() > 2)
        	{
            	a.addError('You can not delete this record');
        	}    
        }
        
    }
}