@istest(seeAllData = false)
public class UtilityDemoTest {
    @istest
    public static void deleteStaffRecordsTest()
    {
        try
        {
            Hospital__c h = new Hospital__c();
            h.Hospital_Name__c = 'Test Hospital';
            h.Hospital_Contact__c = '0000090909';
            h.Country__c = 'India';
            h.State__c = 'Maharashtra';
            h.City__c = 'Nagpur';
            h.Hospital_Type__c = 'Public';
            h.Is_government_Authorized__c = TRUE;
            INSERT h;
            
            Hospital_Staff__c hStaff = new Hospital_Staff__c();
            hStaff.Staff_Name__c = 'Prashant Test';
            hStaff.Staff_Gender__c = 'Male';
            hStaff.Assign_Hospital__c = h.Id;
            INSERT hStaff;
            
            List<Hospital_Staff__c> lstHospStaff = new List<Hospital_Staff__c>();
            lstHospStaff = [SELECT Id FROM Hospital_Staff__c];
            system.debug('lstHospStaff size is == '+lstHospStaff.size());
            
            test.startTest();
            	UtilityDemo.deleteHospitalStaffRecords();
            test.stopTest();    
        }
        catch(Exception e)
        {
            system.debug('Exception is == '+e.getMessage());
        }
    }
    @istest
    public static void testCreateHospitalRecords()
    {
        test.startTest();
        	UtilityDemo.createHospitalRecords(1000, 'Public', TRUE, 'India', 'Maharashtra', 'Mumbai');
        test.stopTest();
    }
}