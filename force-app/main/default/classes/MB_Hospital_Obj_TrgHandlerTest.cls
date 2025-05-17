@istest
public class MB_Hospital_Obj_TrgHandlerTest {
    @testSetup
    public static void setCommonData()
    {
        //List<Hospital__c> lstHospitalToInsert = new List<Hospital__c>();
        TestUtility.createHospitalData('Test Hospital1', '0000090909', NULL,'Maharashtra', 'Nagpur', 'Public', TRUE,'Kids Hospital');
        TestUtility.createHospitalData('Test Hospital2', '0000090909', NULL,NULL, 'Nagpur', 'Public', TRUE,'Mental Hospital');
        TestUtility.createHospitalData('Test Hospital3', '0000090909', NULL,NULL,NULL, 'Public', TRUE,NULL);
        TestUtility.createHospitalData('Test Hospital4', '0000090909', 'India','Maharashtra', NULL, 'Public', TRUE,NULL);
        TestUtility.createHospitalData('Test Hospital5', '0000090909', 'India','Maharashtra', 'Nagpur', 'Public', TRUE,'Cancer Hospital');
        TestUtility.createHospitalData('Test Hospital6', '0000090909', NULL,'Maharashtra', 'Nagpur', 'Public', TRUE,'Mental Hospital');        
    }
    //Assert Statements in Apex Test
    /*
		system.assert
        system.assertEquals
        system.assertNotEquals
	*/
    @istest
    public static void updateHospitalRecords()
    {
        List<Hospital__c> lstHospitalData = new List<Hospital__c>();
        lstHospitalData = [SELECT Id,Hospital_Name__c FROM Hospital__c];
        system.debug('lstHospitalData size is == '+lstHospitalData.size());
        system.debug('lstHospitalData == '+lstHospitalData);
        
        //system.assertEquals(expected,actual,msg);
        system.assertEquals(1,lstHospitalData.size(),'The Actual Data size is'+lstHospitalData.size());
        system.assertNotEquals(2,lstHospitalData.size(),'Both values are same');
        system.assert(lstHospitalData.size() > 0,'hospital size is less than 1');
        /*for(Hospital__c h : [SELECT Id,Hospital_Name__c FROM Hospital__c])
        {
            system.debug('lstHospitalData == '+h.Hospital_Name__c);
            
        }*/
    }
}