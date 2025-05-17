public class HospitalWrapperDemo 
{
    public static List<wrapHospitalInfo> Hospital_Staff_Patient_Information()
    {
        List<wrapHospitalInfo> lstHospWrap = new List<wrapHospitalInfo>();
    	List<Hospital__c> lstHospitalDetail = new List<Hospital__c>();
        List<Patient__c> lstPatientDetails = new List<Patient__c>();
        lstHospitalDetail = [SELECT Id,Hospital_Name__c,(SELECT Id,Staff_Name__c FROM Hospital_Staff__r) Name FROM Hospital__c];
        if(!lstHospitalDetail.IsEmpty())
        {
            for(Hospital__c hs: lstHospitalDetail)
            {
                for(Hospital_Staff__c hsf: hs.Hospital_Staff__r)
                {
                    for(Patient__c p: [SELECT Id,Patient_Name__c,Hospital_Staff__r.Hospital_Name__c FROM Patient__c WHERE Hospital_Staff__c =:hsf.Id])
                    {
                        lstPatientDetails.add(p);                    	     
                    }    
                }
            	lstHospWrap.add(new wrapHospitalInfo(hs,hs.Hospital_Staff__r,lstPatientDetails));   
            }            
        }
        return lstHospWrap;
    }
    public class wrapHospitalInfo
    {
        @AuraEnabled public Hospital__c h{get;set;}
        @AuraEnabled public List<Hospital_Staff__c> lstHospStaff{get;set;}
        @AuraEnabled public List<Patient__c> lstPatients{get;set;}
        
        public wrapHospitalInfo(Hospital__c h1, List<Hospital_Staff__c> lstStaff, List<Patient__c> listPatients)
        {
            this.h = h1;
            this.lstHospStaff = lstStaff;
            this.lstPatients = listPatients;
        }
    }    
}