public class ListDemoExamples {
    public static void getStringData()
    {
        List<String> lstStringVal = new List<String>();
        system.debug('lstStringVal == '+lstStringVal.size());
        system.debug('Initial lstStringVal == '+lstStringVal);
        
        lstStringVal.add('Trupti');
        lstStringVal.add('Prashant');
        lstStringVal.add('Amit');
        lstStringVal.add('Rahul');
        lstStringVal.add('Prashant');
        
        system.debug('lstStringVal after adding values == '+lstStringVal.size());
        system.debug('after lstStringVal == '+lstStringVal);
        
        Boolean Ispresent = lstStringVal.contains('Trupti');
        system.debug('Ispresent == '+Ispresent);
        
        Boolean IsListEmpty = lstStringVal.isEmpty();
        system.debug('IsListEmpty == '+IsListEmpty);
        
        lstStringVal.sort();   // IT will sort all the values in the mentioned list
        system.debug('List after sorting === '+lstStringVal);
        
        List<String> copyListString = new List<String>(lstStringVal);
        system.debug('List after copy === '+lstStringVal);
        
		copyListString.clear();        
        system.debug('After clear === '+copyListString);
        
        
        
        
        Account a = new Account(Name='Acme', BillingCity='New York');    // first record

        Account b = new Account();   // 2nd Record
        
        Account[] q1 = new Account[]{a,b};   // List<Account> q1 = new List<Account>();   == q1 --> a, b
        
        Account[] q2 = q1.clone();           /* List<Account> q2 =  q1.clone();    ===> q2 --> a
                                                                                               b*/
        q1[0].BillingCity = 'San Francisco';  /* q1[0] -- Acme , new york
                                                 q1[1] -- */
        
        system.debug('q1[0].BillingCity --- >'+q1[0].BillingCity);
        System.assertEquals('San Francisco',q1[0].BillingCity);
        //system.asserte
        System.assertEquals('San Francisco',q2[0].BillingCity);
        
        List<String> lstStringValues = new List<String>();
        List<Integer> lstINtValues = new List<Integer>();
        List<Decimal> lstDecValues = new List<Decimal>();
        List<Account> lstAcc = new List<Account>();
        List<Hospital__c> lstHospital = new List<Hospital__c>();
    }
}