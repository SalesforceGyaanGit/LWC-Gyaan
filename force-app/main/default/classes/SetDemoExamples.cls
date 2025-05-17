public class SetDemoExamples {	
    public static void showSetData()
    {
        //list<Account> accList = new List<Account>();
        //
        set<String> emailSet = new set<String>();
        emailSet.add('Prashant');
        emailSet.add('Amit');
        emailSet.add('Vijay');
        emailSet.add('Neha');
        emailSet.add('Prashant');
        emailSet.add('Amit');
        emailSet.add('Rahul');
        
        //system.debug('emailSet after adding values == '+emailSet.size());
        //system.debug('emailSet after adding values == '+emailSet);
    
        List<Hospital_Staff__c> staffList = new List<Hospital_Staff__c>();
        staffList = [Select Id,Staff_Email__c from Hospital_Staff__c];
        //system.debug('staffList id == '+staffList.size());
        //system.debug('staffList  == '+staffList);
        
        
        //set<Id> idset = new set<Id>(staffList);   // wrong
        set<Hospital_Staff__c> setHospStaff = new set<Hospital_Staff__c>(staffList);  // you can create a set for object
        //system.debug('setHospStaff == '+setHospStaff.size());
        
        set<String> StringSet = new set<String>();
        List<Hospital_Staff__c> lstStaff = new List<Hospital_Staff__c>([Select Staff_Email__c from Hospital_Staff__c]);
        for(Hospital_Staff__c h: lstStaff)
        {
            system.debug('Email == '+h.Staff_Email__c);
            StringSet.add(h.Staff_Email__c);
        }
        
        //system.debug('StringSet size == '+StringSet.size());
        //system.debug('StringSet  == '+StringSet);
        
        
        // How to copy set in another set
        set<String> emailIdSet = new set<String>();
        emailIdSet.add('prashinfo19@gmail.com');
        emailIdSet.add('salesforcegyaan@gmail.com');
        emailIdSet.add('salesforce@prashant.com');
        emailIdSet.add('amit@gmail.com');
        emailIdSet.add('vijay@gmail.com');
        emailIdSet.add('salesforcegyaan@gmail.com');
        
        set<String> emailIdCopySet = new Set<String>(emailIdSet);
        system.debug('emailIdCopySet == '+emailIdCopySet);
        system.debug('emailIdCopySet size == '+emailIdCopySet.size());
        
    }
}