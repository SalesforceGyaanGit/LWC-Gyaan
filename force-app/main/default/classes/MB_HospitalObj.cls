public class MB_HospitalObj {
    @AuraEnabled(cacheable = true)
    public static List<Hospital__c> getfetchHospitalRecords()
    {
        List<Hospital__c> lstHospital = new List<Hospital__c>();
        lstHospital = [SELECT Id, Name, Hospital_Name__c FROM Hospital__c];
        Return lstHospital;
    }
    @AuraEnabled(cacheable = true)
    public static list<Hospital_staff__c> getHospitalStaffDetails()
    {
        List<Hospital_staff__c> lstHospitalStaff = new List<Hospital_staff__c>();
        lstHospitalStaff = [SELECT Id, Name, Staff_Name__c,Hospital_Name__c FROM Hospital_staff__c ORDER BY Staff_Name__c ASC];
        Return lstHospitalStaff;
    }
    @AuraEnabled(cacheable=true)
    public static Contact getSingleContact(){
        return [SELECT Id, Name, Title, Phone, Email FROM Contact LIMIT 1];
    }
}