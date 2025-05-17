public without sharing class HospitalInformation_Refreshed {
    @AuraEnabled(cacheable = true)  
    public static List<Hospital__c> showHospitalRecords(String searchVar){

        try{
            String searchRecName = '%'+searchVar+'%';
            List<Hospital__c> lstHospital = new List<Hospital__c>(); // this list is created to hold the hospital records.
            lstHospital = [SELECT Id, Name,Hospital_Name__c,City__c,Country__c FROM Hospital__c where Hospital_Name__c like :searchRecName WITH SECURITY_ENFORCED];
            system.debug('lstHospital == '+lstHospital.size());
            if(!lstHospital.isEmpty()){
                return lstHospital;
            }else{
                return null;
            }
            
        }catch(Exception e){
            system.debug('Exception is === '+e.getMessage());
            return null;
        }
    }
    @AuraEnabled(cacheable = true)  
    public static List<Hospital_Staff__c> showHospitalStafRecords(String searchStaffVar){
        try{

            String searchStaffRecName = '%'+searchStaffVar+'%';
            List<Hospital_Staff__c> lstHospitalStaff = new List<Hospital_Staff__c>(); // this list is created to hold the hospital records.
            lstHospitalStaff = [Select Id,Staff_Name__c,Staff_Gender__c,Staff_Email__c,Staff_Dob__c,Staff_Designation__c,Staff_Contact__c,Staff_Age__c  from Hospital_Staff__c  where Staff_Name__c like :searchStaffRecName WITH SECURITY_ENFORCED];
            system.debug('lstHospitalStaff == '+lstHospitalStaff.size());
            if(!lstHospitalStaff.isEmpty()){
                return lstHospitalStaff;
            }else{
                return null;
            }
        }catch(Exception e){
            system.debug('The exception is == '+e.getMessage());
            return null;
        }
    }
}