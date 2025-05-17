/*
Author: Prashant Sontakke
Company: Salesforce Gyaan
Purpose: This class is used to return the list of account Records
*/

public class AccountDetails {
    @AuraEnabled(cacheable=true)
    public static list<Account> lstAccountRecs()
    {
        List<Account> alist = new list<Account>();
        alist = [Select id,name,fax,industry,website from account where fax != null];
        return alist;
    }
    public static list<Account> lstAccountRecs2()
    {
        List<Account> alist = new list<Account>();
        alist = [Select id,name,fax from account where fax != null LIMIT 5];
        return alist;
    }
}