public class FutureMethodDemo {
    public FutureMethodDemo()
    {
        system.debug('I am in Constructor');
        method1();
        method2();
        method3();
        //method4();
        //method5();
        //method6();
    }
    public void method1()
    {
        system.debug('I am in method 1');
        /*List<Hospital__c> lstHospital = new List<Hospital__c>();
        lstHospital = [SELECT Id,Name FROM Hospital__c];
        
        method4(lstHospital);*/
        
        /*Account a = new Account();
        a = [SELECT Id,Name FROM Account LIMIT 1];
        method5(a);*/
        
        List<Hospital__c> lstHospital = new List<Hospital__c>();
        lstHospital = [SELECT Id FROM Hospital__c];
        
        set<Id> idSetData = new set<Id>();
        For(Hospital__c h : lstHospital)
        {
            idSetData.add(h.Id);
        }
        Method6(idSetData);
    }        
    public static Map<Id,Hospital__c> method2()
    {
        system.debug('I am in method 2');
        return null;
    }
    public static Decimal method3()
    {
        system.debug('I am in method 3');
        return null;
    }
    /*@future
    public static void method4(List<Hospital__c> lstHospRecs)  // Future method supports only static void
    {
        system.debug('I am in method 4');
    }*/
    /*@future
    public static void method5(Account acc)  // Future method supports only static void
    {
        system.debug('I am in method 5');
    }*/
    @future
    public static void method6(set<Id> IdSet)  // Future method supports only static void
    {
        system.debug('I am in method 6');
        UtilityDemo.deleteHospitalRecords();
    }
    @future
    public static void method7()  // Future method supports only static void
    {
        system.debug('Called from CallMethod7');
    }
    @future
    public static void CallMethod7()  // Future method supports only static void
    {
        system.debug('I am in method CallMethod7');
        method7();
    }
	
}