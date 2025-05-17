public class MB_HospitalInformation {
    public static void fetchPublicHospitalData()
    {
        List<Hospital__c> lstHospial = new List<Hospital__c>();
        lstHospial = [SELECT id,Hospital_Type__c FROM Hospital__c where Hospital_Type__c  = 'Public' LIMIT 10];
        
        set<Id> recId = new set<Id>();
        for(Hospital__c h: lstHospial)
        {
            recId.add(h.Id);
        }
        system.debug('recId == '+recId);
    }
    public static void fetchPublicHospitalData1()
    {
        
        /*List<Hospital__c> lstHospial = new List<Hospital__c>();
        lstHospial = [SELECT id,Hospital_Type__c FROM Hospital__c where Hospital_Type__c  = 'Public' LIMIT : recLimit];
        
        set<Id> recId = new set<Id>();
        for(Hospital__c h: lstHospial)
        {
            recId.add(h.Id);
        }*/
        // Now find all the child records for the hospitals, whose Id is there in the set
        List<Hospital_staff__c> lstHospitalStaff = new List<Hospital_staff__c>();
        lstHospitalStaff = [SELECT Id,Staff_Name__c,Hospital_Name__c,Assign_Hospital__c,Assign_Hospital__r.Hospital_Type__c FROM Hospital_staff__c WHERE Assign_Hospital__r.Hospital_Type__c  = 'Public'];
        
        Map<Id,List<Hospital_staff__c>> mapHospitalAndStaff = new Map<Id,List<Hospital_staff__c>>();
        For(Hospital_staff__c h : lstHospitalStaff)
        {
            if(mapHospitalAndStaff.containsKey(h.Assign_Hospital__c))
            {
            	mapHospitalAndStaff.get(h.Assign_Hospital__c).add(h);    
            }
            else
            {
                mapHospitalAndStaff.put(h.Assign_Hospital__c,new List<Hospital_staff__c>{h});
            }
            
            //system.debug('mapHospitalAndStaff hospital ID  is =='+h.Assign_Hospital__c+' And its values are == '+mapHospitalAndStaff.get(h.Assign_Hospital__c).Staff_Name__c);
            
        }
        system.debug('mapHospitalAndStaff keyset == '+mapHospitalAndStaff.keyset());
        system.debug('mapHospitalAndStaff values == '+mapHospitalAndStaff.values());
        system.debug('mapHospitalAndStaff.get for ==> a015i000013v3lzAAA '+mapHospitalAndStaff.get('a015i000013v3lzAAA'));
    }
}