public without sharing class PatientInformation_Refreshed {
    @AuraEnabled(cacheable = true)
	public static List<Patient__c > showPatientName(){
        try{
            List<Patient__c> lstPatients = [Select Id,Patient_Name__c from Patient__c WITH SECURITY_ENFORCED];
            if(!lstPatients.isEmpty()){
                return lstPatients;
            }
            else{
                return null;
            }
            
        }catch(Exception e){
        	system.debug('exception is === '+e.getMessage());    
            return null;
        }
    }
}