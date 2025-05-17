public class DML_Demo {
	// This class is used to perform DML operations only
    public static void InsertSingleRecordDemo()
    {
        //plot == Object ka Instance
        //Reti, gitti, ite, cement === Fields
        Hospital_Staff__c hRec = new Hospital_Staff__c();   // Creating Instance of a record
        hRec.Staff_Name__c = 'Prashant'; // we have used hard coded Name just for practical, never use this approach
        hRec.Staff_Gender__c = 'Male'; // we have used hard coded Id just for practical, never use this approach
        hRec.Assign_Hospital__c = 'a015i000013v3mEAAQ'; // we have used hard coded Id just for practical, never use this approach
        hRec.Date_of_Joining__c = Date.today(); 
        hRec.Staff_Dob__c = Date.newInstance(1993, 01, 19);
		hRec.Is_staff_physically_challenged__c = False;
        hRec.Staff_Email__c = 'salesforcegyaan@gmail.com';
        try
        {
            system.debug('hRec Before == '+hRec);
        	INSERT hRec;   // DML statements should be written inside of Try Block always
            system.debug('hRec After == '+hRec);            
        }
        catch(Exception e)
        {
            system.debug('Exception is ===> '+e.getMessage());
        }
        
    }
    public static void UpdateBulkRecordsDemo()
    {
        List<Hospital__c> lstHospitals = new List<Hospital__c>();
        lstHospitals = [SELECT Id,Hospital_Name__c,Hospital_Type__c,Hospital_Website__c,Hospital_Contact__c,Amenities_available__c FROM Hospital__c];
		system.debug('lstHospitals size == '+lstHospitals.size());
        List<Hospital__c> lstUpdatedHospitals = new List<Hospital__c>();
        if(!lstHospitals.isEmpty())
        {
            system.debug('lstHospitals has some data == '+lstHospitals.size());
            //Integer count = 0;
            for(Hospital__c h:lstHospitals)
            {
                //system.debug('Index == '+lstHospitals[count].Id);
                //count++;
                if(h.Hospital_Website__c == Null)
                {
                    system.debug('I am in IF');
                    h.Hospital_Website__c = 'www.salesforcegyaan.com';
                    lstUpdatedHospitals.add(h);
                    //UPDATE h;
                }
                else
                {
                    system.debug('I am in Else');
                }                
            }
            try
            {
                if(!lstUpdatedHospitals.isEmpty())
                {
                	UPDATE lstUpdatedHospitals;    
                }            	    
            }
            catch(Exception e)
            {
                system.debug('Exception is === '+e.getMessage());
            }            
        }            
        else
        {
            system.debug('lstHospitals has no data == '+lstHospitals.size());
        }
    }
    public static void DeleteBulkRecordsDemo()
    {
        List<Hospital__c> lstDeleteHospitals = new List<Hospital__c>();
        lstDeleteHospitals = [SELECT Id FROM Hospital__c WHERE Is_government_Authorized__c = FALSE];
        try
        {
            if(!lstDeleteHospitals.isEmpty())
            {
            	DELETE lstDeleteHospitals;    
            }            
        }
        catch(Exception e)
        {
            system.debug('Exception is === '+e.getMessage());
        }
    }
    public static void UndeleteBulkRecordsDemo()
    {
        List<Hospital__c> lstUndeleteHospitals = new List<Hospital__c>();
        lstUndeleteHospitals = [SELECT Id FROM Hospital__c WHERE Is_government_Authorized__c = FALSE AND isdeleted = TRUE ALL ROWS];
        system.debug('Size of lstUndeleteHospitals == '+lstUndeleteHospitals.size());
        try
        {
            if(!lstUndeleteHospitals.isEmpty())
            {
                UNDELETE lstUndeleteHospitals;
            }
            else
            {
                system.debug('No Records found to Undelete');
            }            
        }
        catch(Exception e)
        {
        	system.debug('Exception is === '+e.getMessage());    
        }
    }    
    public static void UpsertDemo()
    {
        List<Account> acctsList = new List<Account>([SELECT Id, Name, BillingCity FROM Account WHERE BillingCity = 'Bombay']);
        for(Account a: acctsList)
        {
       		a.BillingCity = 'Mumbai';    // Updating Record
        }

        Account newAcct = new Account(Name = 'Acme', BillingCity = 'San Francisco');    //Insert Record
        acctsList.add(newAcct);
        
        try
        {
        	UPSERT acctsList;
        }
        catch(Exception e)
        {
            system.debug('Exception is == '+e.getMessage());
        }
    }    
}