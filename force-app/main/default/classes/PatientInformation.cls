public class PatientInformation {
    @AuraEnabled(cacheable=true)
    public static List<Patient__c> fetchPatientInformation(String searchKey)
    {

        String searchKeyVal = searchKey+'%';
        List<Patient__c> lstPatient = new List<Patient__c>([Select Id,Name,Patient_Name__c,Country__c,State__c,City__c,Patient_Contact__c From Patient__c WHERE
                                                           Patient_Name__c LIKE:searchKeyVal]);
        system.debug('lstPatient == '+lstPatient.size());
        system.debug('lstPatient == '+lstPatient);
        if(!lstPatient.isempty())
        {
            return lstPatient;
        }
        else
        {
            return null;
        }
    }
}