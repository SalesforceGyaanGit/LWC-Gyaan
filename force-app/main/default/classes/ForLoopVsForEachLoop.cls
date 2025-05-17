public class ForLoopVsForEachLoop {
    public static void forLoopDemo()
    {
        For(Integer i=0;i<5;i++)
        {
            system.debug('The value of current I is == '+i);
        }
    }
    public static void forEachLoopDemo()
    {
    	//Note: For Each loop Iterates over list of values
		List<Hospital_staff__c> lstHospitalStaff = new List<Hospital_staff__c>();
        lstHospitalStaff = [SELECT Id,Hospital_Name__c, Date_of_Joining__c,Bank_Name__c,Is_staff_physically_challenged__c FROM Hospital_staff__c];
        
        For(Hospital_staff__c h:lstHospitalStaff)
        {
            system.debug('Hospital Record ID is == '+h.Id);
            system.debug('Hospital Name is == '+h.Hospital_Name__c);
            system.debug('Date of Joining =='+h.Date_of_Joining__c);
            system.debug('Bank Name == '+h.Bank_Name__c);
            system.debug('Physically challenged == '+h.Is_staff_physically_challenged__c);
            system.debug('******************************************');
        } 
        
    }
    public static void forEachLoopSOQLDemo()
    {
    	//Note: For Each loop Iterates over list of values
		
        For(Hospital_staff__c h:[SELECT Id,Hospital_Name__c, Date_of_Joining__c,Bank_Name__c,Is_staff_physically_challenged__c FROM Hospital_staff__c])
        {
            system.debug('Hospital Record ID is == '+h.Id);
            system.debug('Hospital Name is == '+h.Hospital_Name__c);
            system.debug('Date of Joining =='+h.Date_of_Joining__c);
            system.debug('Bank Name == '+h.Bank_Name__c);
            system.debug('Physically challenged == '+h.Is_staff_physically_challenged__c);
            system.debug('===================================================');
        }        
    }
    
    public static void continueMethodDemo()
    {
        // Continue statement breaks one Iteration in the loop (Skip perticular condition)
        system.debug('I am in continueMethodDemo');
        for(Integer i=0;i<10;i++)
        {
            if(i==5)
            {
            	continue;    
            }
            system.debug('I is == '+i);            
        }
    }
    public static void breakMethodDemo()
    {
    	// Break statement is used to Jump out of the Loop
    	system.debug('I am in breakMethodDemo');
        for(Integer i=0;i<10;i++)
        {
            system.debug('I is == '+i); 
            if(i==5)
            {
            	break;    
            }
                       
        }
    }
    public static void whileLoopDemo()
    {
		Integer count = 0;
        while(count < 10)
        {
            system.debug('Current count is == '+count);
            if(count == 5)
            {
                break;
            }
            count++;
        }        
    }
    public static void DoWhileLoopDemo()
    {
        /*
            do
            {
            	
            }
            while(condition);
		*/
        system.debug('I am in DoWhileLoopDemo');
        Integer i = 1;
        do
        {
            system.debug(' I is == '+i);
            i++;
        }while(i<=5);
    }
}