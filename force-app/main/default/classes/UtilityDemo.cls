public class UtilityDemo {
    public static Boolean IsUndeleted = false;
    public static void deleteHospitalStaffRecords()
    {
        List<Hospital_staff__c> lstStaffToDelete = new List<Hospital_staff__c>();
        lstStaffToDelete = [SELECT id FROM Hospital_staff__c];
        system.debug('lstStaffToDelete == '+lstStaffToDelete.size());
        try
        {
            if(!lstStaffToDelete.isEmpty())
            {
                DELETE lstStaffToDelete;
                system.debug('Records Deleted Successfully');
            }
        }
        catch(Exception e)
        {
            system.debug('Exception is == '+e.getMessage());
        }
    }
    public static void deleteHospitalRecords()
    {
        List<Hospital__c> lstHospToDelete = new List<Hospital__c>();
        lstHospToDelete = [SELECT id FROM Hospital__c WHERE Hospital_Type__c <> 'NGO' LIMIT 1500];
        try
        {
            if(!lstHospToDelete.isEmpty())
            {
                DELETE lstHospToDelete;
                system.debug('Records Deleted Successfully');
            }
        }
        catch(Exception e)
        {
            system.debug('Exception is == '+e.getMessage());
        }
    }
    public static void createHospitalRecords(Integer NumberOfRecords, String HospitalType, Boolean IsGovAuth, String country, String state, String city)
    {
        system.debug('I am in createHospitalRecords');
        List<Hospital__c> insertHospitalList = new List<Hospital__c>();
        for(Integer i=0; i<NumberOfRecords; i++)
        {
            Hospital__c h = new Hospital__c();
            h.Hospital_Name__c = 'Test Hospital'+i;
            h.Hospital_Contact__c = '0000090909';
            h.Country__c = country;
            h.State__c = state;
            h.City__c = city;
            h.Hospital_Type__c = HospitalType;
            h.Is_government_Authorized__c = IsGovAuth;
			insertHospitalList.add(h);  
            //system.debug('I am in for loop & the size of list is == '+insertHospitalList.size());
        } 
        try
        {
            if(!insertHospitalList.IsEmpty())
            {
                system.debug('I am in TRY & size while INsertion is == '+insertHospitalList.size());
                INSERT insertHospitalList;
            }
        }catch(Exception e)
        {
            system.debug('Exception is == '+e.getMessage());
        }
    }
    public static void undeleteHospitalRecords()
    {
        //Undeleted = true;
        List<Hospital__c> lstToUndelete = new List<Hospital__c>();
        lstToUndelete = [SELECT Id FROM Hospital__c WHERE IsDeleted = TRUE ALL ROWS];
        system.debug('lstToUndelete size is == '+lstToUndelete.size());
        
        try
        {
            if(!lstToUndelete.isEmpty())
            {
            	UNDELETE lstToUndelete; 
            }            
        }
        catch(Exception e)
        {
            system.debug('Exception is == '+e.getMessage());
        }
    }
    public static void createAccountRecs()
    {
        system.debug('I am in createAccountRecs method');
        List<Account> alist = new List<Account>();
        for(Integer i=0;i<500;i++)
        {
        	Account a = new Account();
            a.Name = 'Sgyaan Account'+i;
            alist.add(a);
        }
        try
        {
            if(!alist.isEmpty())
            {
                INSERT alist;
                system.debug('Account Records Inserted');
            }
        }catch(Exception e)
        {
            system.debug('Exception is == '+e.getMessage());
        }
    }
    public static void deleteAccount()
    {
        //List<Account> alist = new List<Account>();
        DELETE [SELECT Id FROM Account];
    }
    public static void sendEmail(set<String> EmailSet, String subject, String MsgBody)
    {
        system.debug('I am in sendEmail Method ');
        system.debug('EmailSet == '+EmailSet);
        system.debug('subject == '+subject);
        system.debug('MsgBody == '+MsgBody);
        
        Messaging.SingleEmailMessage message = new Messaging.SingleEmailMessage();
        List<String> lstOfRecepient = new List<String>(EmailSet);
        message.toAddresses = lstOfRecepient;  // Jisko bhejna hai
        message.subject = subject;
        message.plainTextBody = MsgBody;
        Messaging.SingleEmailMessage[] messages =   new List<Messaging.SingleEmailMessage> {message};
        Messaging.SendEmailResult[] results = Messaging.sendEmail(messages);
        
        if (results[0].success) {
            System.debug('The email was sent successfully.');
        } else {
            System.debug('The email failed to send: ' + results[0].errors[0].message);
        }
    }    
    @AuraEnabled(cacheable=true)
    public static Map<String,String> fetchListofObjects()
    {
        Map<String, String> sObjectNamebyLabel = new Map<String, String>();
        for(SObjectType objectType : Schema.getGlobalDescribe().values()) {
            DescribeSObjectResult sObjectDescribe = objectType.getDescribe();
            if(sObjectDescribe.isAccessible() && sObjectDescribe.isQueryable()) {
                sObjectNamebyLabel.put(sObjectDescribe.getLabel(),sObjectDescribe.getName());
            }
        }
		system.debug('keyset == '+sObjectNamebyLabel.keyset());
        system.debug('values == '+sObjectNamebyLabel.values());        
        return sObjectNamebyLabel;
    }
    @AuraEnabled(cacheable=true)
    public static List<String> getSObjectList() {
        List<String> objectNames = new List<String>();
        
        // Get a list of all sObjects
        Map<String, Schema.SObjectType> globalDescribe = Schema.getGlobalDescribe();
        for (String objectName : globalDescribe.keySet()) {
            objectNames.add(objectName);
        }
        
        return objectNames;
    }
}