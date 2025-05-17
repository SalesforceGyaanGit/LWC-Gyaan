@istest
public class TestUtility {
    public static void createHospitalData(String name,String con, String country,String st,String city,String Type, Boolean govAuth,String specHosp)
    {
        List<Hospital__c> lstHospitalToInsert = new List<Hospital__c>();
        Hospital__c h1 = new Hospital__c();
        h1.Hospital_Name__c = name;
        h1.Hospital_Contact__c = con;
        h1.Country__c = country;
        h1.State__c = st;
        h1.City__c = city;
        h1.Hospital_Type__c = Type;
        h1.Is_government_Authorized__c = govAuth;
        h1.Hospital_Specialised_for__c = specHosp;
        lstHospitalToInsert.add(h1);
        
        try
        {
            if(!lstHospitalToInsert.isEmpty())
            {
                INSERT lstHospitalToInsert;
                system.debug('Records Inserted Successfully');
            }
        }catch(Exception e)
        {
            system.debug('Exception is == '+e.getMessage());
        }
    }
}