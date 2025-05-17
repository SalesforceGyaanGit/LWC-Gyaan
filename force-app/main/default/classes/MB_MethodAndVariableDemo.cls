public class MB_MethodAndVariableDemo {
    /*
		There are different ways of creating and calling apex methods
		1. Constructor (Param & non Param)
		2. Void method (Param & Non Param)  -Such methods do not return any values
	    3. static void method (Param & Non Param)
		4. Return  - String, Integer, Decimal, double, List (Param & non Param)
	*/
    Integer age = 30;  // It supports 32 Bit
    Long adharCard = 988998899889L;   // It supports 64 Bit
    String name = 'Salesforce Gyaan';    
    Boolean IsIndian = TRUE;
    Date dob = Date.newInstance(1993, 01, 19);
    Hospital_Staff__c h = new Hospital_Staff__c();
    Datetime dtime = DateTime.newInstanceGMT(2013, 11, 12, 3, 3, 3);
    Decimal salary = 15000.45;
    Double salary1 = 1.4898987985;
    ID recId = 'a005i00000Jwg6H';
    
    /*
    List
    Set
    Map
    */    
    public MB_MethodAndVariableDemo()
    {
        system.debug('I am in default constructor');
        //showMyName();
    }
    public MB_MethodAndVariableDemo(String name, Integer age)
    {
        system.debug('I am in Parameterized constructor');
        system.debug('Name is == '+name);
        system.debug('age is == '+age);
    }
    public MB_MethodAndVariableDemo(String name)
    {
        system.debug('I am in Parameterized constructor with single param');
        system.debug('Name is == '+name);
        //system.debug('age is == '+age);
    }
    public void showMyName()
    {
        String name = 'Prashant';
        system.debug('My Name is '+name);
        showMyAddress();
    }
    public void showMyName(String name)
    {
        //String name = 'Sagar';
        system.debug('My Name is '+name);
        
        showMyName('Prashant',30,90000);
    }
    public void showMyName(String name, Integer age, Decimal salary)
    {
        //String name = 'Sagar';
        system.debug('My Name is '+name+' Age is == '+age+' Salary is == '+salary);
    }
    public static void showMyAddress()
    {
        String address = 'Nagpur, Maharashtra';
        system.debug('address is == '+address);
        
        String compName = getMyCompanyName('Salesforce Gyaan');
        system.debug('compName is == '+compName);
    }
    public static Integer getMyage()
    {
        Integer age = 30;
        Return age;        
    }
    public static String getMyCompanyName(String cName)
    {
        Return cName;
    }
    public static List<Account> getMyAccounts()
    {
        List<Account> lstAccount = new List<Account>([SELECT Id,Name From Account]);
        return lstAccount;
    }
}