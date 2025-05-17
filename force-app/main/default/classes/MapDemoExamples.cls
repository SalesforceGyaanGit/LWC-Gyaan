public class MapDemoExamples {
    public static void mapDemo()
    {
        Map<String,Integer> mapUsernameAndAge = new Map<String,Integer>();
        mapUsernameAndAge.put('p@sgyaan.com', 30);
        mapUsernameAndAge.put('q@sgyaan.com', 29);
        mapUsernameAndAge.put('r@sgyaan.com', 28);
        mapUsernameAndAge.put('s@sgyaan.com', 27);
        
        system.debug('mapUsernameAndAge ==> '+mapUsernameAndAge);
        
        // Important Map Methods
        // put(), get(key), containsKey(key),  keyset(),values(), size()
        
        Boolean KeyIsPresent = mapUsernameAndAge.containsKey('t@sgyaan.com'); 
        system.debug('KeyIsPresent ==> '+KeyIsPresent);
        
        if(KeyIsPresent ==  TRUE)
        {
        	Integer age = mapUsernameAndAge.get('t@sgyaan.com');
        	system.debug('Age is == '+age);    
        }
        else
        {
            system.debug('No such key is present');
        }
        
        set<String> setString = mapUsernameAndAge.keyset();
        system.debug('setString === > '+setString);            
		       
        List<Integer> lstVal = mapUsernameAndAge.values();
        system.debug('lstVal === > '+lstVal);
        
        Integer mapSize = mapUsernameAndAge.size();
        system.debug('mapSize == >'+mapSize);
        
        /*List<Hospital__c> lstHospitalRecs = new List<Hospital__c>();
        lstHospitalRecs = [Select Id,Hospital_Name__c,Hospital_Address__c,Hospital_Contact__c,Country__c FROM Hospital__c];*/
        
        /*Map<Id,Hospital__c> mapIdAndHospitalRecord = new Map<Id,Hospital__c>(lstHospitalRecs);
        system.debug('mapIdAndHospitalRecord == > '+mapIdAndHospitalRecord);*/
        
        Map<Id,Hospital__c> mapIdAndHospitalRecord = new Map<Id,Hospital__c>([Select Id,Hospital_Name__c,Hospital_Address__c,Hospital_Contact__c,Country__c FROM Hospital__c]);
        system.debug('mapIdAndHospitalRecord == > '+mapIdAndHospitalRecord);        
        
    }
    public static void storeParentAndChildInMap()
    {
    	List<Hospital_Staff__c> staffList = new List<Hospital_Staff__c>();
        Map<Id,List<Hospital_Staff__c>> mapIdAndHospStaff = new Map<Id,List<Hospital_Staff__c>>();
        list<Hospital_Staff__c> hstafflst = new List<Hospital_Staff__c>();
        For(Hospital__c h : [SELECT Id,Hospital_Name__c,(Select Id,Staff_Name__c,Staff_Type__c,Assign_Hospital__c from Hospital_Staff__r) FROM Hospital__c])
        {
           
        }
       
        try
        {
            if(!staffList.isEmpty())
            {
            	UPDATE staffList;     
            }
        }
        catch(Exception e)
        {
            system.debug('Exception is == '+e.getMessage());
        }
        system.debug('mapIdAndHospStaff == >> '+mapIdAndHospStaff);
        
    }
}