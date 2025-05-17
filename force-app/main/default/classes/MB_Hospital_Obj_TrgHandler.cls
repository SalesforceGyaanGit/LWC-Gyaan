public class MB_Hospital_Obj_TrgHandler {
    public static void BeforeInsertDemo(List<Hospital__c> lstHospitalRecs)
    {
        system.debug('I am in Before Insert Demo');
        system.debug('Size of lstHospitalRecs == '+lstHospitalRecs.size()+' And record is == '+lstHospitalRecs);
        for(Hospital__c h: lstHospitalRecs)
        {
            if(h.Country__c == Null)
            {
                h.addError('Please select the country');
            }
            if(h.Country__c == Null && h.State__c == Null)
            {
                h.addError('Please select the country & its State');
            }
            
            if(h.Country__c == Null && h.State__c == Null && h.City__c == Null)
            {
                h.addError('Please Select Country, State and City');
            }
            if(h.Country__c <> Null && (h.State__c == Null || h.City__c == Null))
            {
                h.addError('Please Input state / city ');
            }            
        }        
    }
    /*public static void AfterInsertDemo(List<Hospital__c> lstHospitalRecs)
    {
        system.debug('I am in After Insert Demo');
        system.debug('Size of lstHospitalRecs == '+lstHospitalRecs.size()+' And record is == '+lstHospitalRecs);
        List<Hospital_Staff__c> insertLstHStaff = new List<Hospital_Staff__c>();
        For(Hospital__c h:lstHospitalRecs)
        {
            Hospital_Staff__c hstaff = new Hospital_Staff__c();
            hstaff.Staff_Name__c = 'Staff1';
            hstaff.Staff_Gender__c = 'Male';
            hstaff.Staff_Email__c = 'test@gmail.com';
            hstaff.Assign_Hospital__c = h.Id;
            insertLstHStaff.add(hstaff);
        }
        try
        {
            if(!insertLstHStaff.isEmpty())
            {
                INSERT insertLstHStaff;
            }            
        }
        catch(Exception e)
        {
            system.debug('Exception is == '+e.getMessage());
        }
    }*/
    public static void AfterInsertMapDemo(Map<Id,Hospital__c> mapHospitalRecs)
    {
        system.debug('I am in AfterInsertMapDemo');
        system.debug('mapHospitalRecs size is == '+mapHospitalRecs.size());
        Set<Id> hospitalRecIdSet  = new set<Id>();
        if(!mapHospitalRecs.IsEmpty())
        {
            /*For(Hospital__c h: mapHospitalRecs.values())
            {
                system.debug('Rec Id of current record Is == > '+h.Id);
                system.debug('current record Is == > '+h);
                hospitalRecIdSet.add(h.Id);
                if(h.Create_Auto_Staff__c == False) // If create auto staff is unchecked
                {
                    h.Create_Auto_Staff__c = TRUE;
                }
            }*/
            //system.debug('hospitalRecIdSet == '+hospitalRecIdSet);
            //system.debug('mapHospitalRecs.keyset() == '+mapHospitalRecs.keyset());
            List<Hospital__c> lstUpdateHospitalRec = new List<Hospital__c>();
            For(Hospital__c h1: [SELECT Id,Create_Auto_Staff__c  FROM Hospital__c WHERE Id IN: mapHospitalRecs.keyset()])
            {
               	if(h1.Create_Auto_Staff__c == False) // If create auto staff is unchecked
                {
                    h1.Create_Auto_Staff__c = TRUE;
                    lstUpdateHospitalRec.add(h1);
                }
            }
            try
            {
                if(!lstUpdateHospitalRec.IsEmpty())
                {
                    //UPDATE lstUpdateHospitalRec;
                }
            }
            catch(Exception e)
            {
                system.debug('Exception is == '+e.getMessage());
            }
        }
    }
    public static void BeforeUpdateDemo(List<Hospital__c> lstHospitalToUpdate, List<Hospital__c> lstOldHospitalData)
    {
        //lstHospitalToUpdate - will fetch new values from Edit Page
        //lstOldHospitalData - will fetch old values from Detail Page
        system.debug('I am in Before Update Demo');
        Map<Id,Hospital__c> oldmapHospital = new Map<Id,Hospital__c>(lstOldHospitalData);
        Map<Id,Hospital__c> newmapHospital = new Map<Id,Hospital__c>(lstHospitalToUpdate);
        
        system.debug('oldmapHospital == '+oldmapHospital.size());
        system.debug('newmapHospital == '+newmapHospital.size());
        
        For(Hospital__c h:newmapHospital.values())
        {
            system.debug('I am in for loop');
            system.debug('new Id == '+newmapHospital.get(h.id));
            system.debug('old Id == '+oldmapHospital.get(h.Id));
            if(newmapHospital.get(h.id).Id == oldmapHospital.get(h.Id).Id)
            {
                system.debug('1 == '+newmapHospital.get(h.Id).Hospital_Website__c);
                system.debug('2 == '+oldmapHospital.get(h.Id).Hospital_Website__c);
                if(oldmapHospital.get(h.Id).Hospital_Specialised_for__c == 'Cancer Hospital')
                {
                	if(newmapHospital.get(h.Id).Hospital_Specialised_for__c != oldmapHospital.get(h.Id).Hospital_Specialised_for__c)
                	{
                    	h.addError('You can not change cancer hospital type as any other hospital type');
                	}    
                }
                
            }
        }
        
        /*For(Hospital__c h:lstHospitalToUpdate)
        {
            system.debug('New Name of Hospital is == '+h.Hospital_Name__c);
            if(h.Country__c == Null)
            {
                h.addError('Please select the country');
            }
            else if(h.Country__c == Null && h.State__c == Null)
            {
                h.addError('Please select the country & its State');
            }
            else if(h.Country__c == Null && h.State__c == Null && h.City__c == Null)
            {
                h.addError('Please Select Country, State and City');
            }
            else if(h.Country__c <> Null && (h.State__c == Null || h.City__c == Null))
            {
                h.addError('Please Input state / city ');
            }
            if(String.isBlank(h.Hospital_Website__c))
            {
                system.debug('Website is blank');
                h.addError('You can not update a website as a blank value');
            }
        }
        For(Hospital__c h:lstOldHospitalData)
        {
            system.debug('Old Name of Hospital is == '+h.Hospital_Name__c);
        }*/
    }
    public static void AfterUpdateDemo(Map<Id,Hospital__c> oldMapRec, Map<Id,Hospital__c> newMapRec)
    {
        system.debug('I am in After UPdate Demo');
        List<User> lstUser = new List<user>([SELECT ID,Name, FirstName, LastName, Email FROM USER WHERE ID =:newMapRec.values().CreatedById]);
        system.debug('lstUser == '+lstUser.size());
        set<String> emailSet = new set<String>();
        For(User u : lstUser)
        {
            emailSet.add(u.Email);
        }
        system.debug('emailSet == '+emailSet.size());
        /*for(Hospital__c h: oldMapRec.values())
        {
            
            if(newMapRec.containsKey(h.Id) && (oldMapRec.get(h.Id).Hospital_Website__c <> newMapRec.get(h.Id).Hospital_Website__c))
            {
				//sendMailToRecordOwner(newMapRec.get(h.Id).Hospital_Website__c,userName.Email);	            	    
            }
        }*/
    }
    public static void sendMailToRecordOwner(String websiteName, Set<String> ownerEmail, String BodyMsg, String Subj)
    {
        system.debug('I am in sendMailToRecordOwner');
        system.debug('ownerEmail =='+ownerEmail);
        system.debug('websiteName =='+websiteName);
        Messaging.SingleEmailMessage message = new Messaging.SingleEmailMessage();
        List<String> lstOfRecepient = new List<String>(ownerEmail);
        //lstOfRecepient.add(ownerEmail);
        
        message.toAddresses = lstOfRecepient;  // Jisko bhejna hai
        //message.subject = 'Website Changed';
        message.subject = Subj;
        //message.plainTextBody = 'Hi, Your Website has now been changed to :'+websiteName;
        message.plainTextBody = BodyMsg;
        Messaging.SingleEmailMessage[] messages =   new List<Messaging.SingleEmailMessage> {message};
        Messaging.SendEmailResult[] results = Messaging.sendEmail(messages);
        
        if (results[0].success) {
            System.debug('The email was sent successfully.');
        } else {
            System.debug('The email failed to send: ' + results[0].errors[0].message);
        }
    }
    public static void BeforeDeleteDemo(Map<Id,Hospital__c> mapOfRecordsToBeDeleted)
    {
        system.debug('I am in Before Delete Demo');
        if(!mapOfRecordsToBeDeleted.isEmpty())
        {
            system.debug('mapOfRecordsToBeDeleted is not empty and the size is =='+mapOfRecordsToBeDeleted.size());
            For(Hospital__c h:mapOfRecordsToBeDeleted.values())
            {
                if(h.Hospital_Type__c == 'NGO')
                {
                    h.Hospital_Type__c.addError('You are not allowed to delete NGO Records');
                }
            }
        }
    }
    public static void AfterDeleteDemo(Map<Id,Hospital__c> mapOfRecordsDeleted)
    {
        system.debug('I am in After Delete Demo');
        set<Id> deletedRecordsId = new set<Id>();
        set<Id> OwnerId = new set<Id>();
        if(!mapOfRecordsDeleted.isEmpty())
        {
            system.debug('mapOfRecordsDeleted is not empty');  
            for(Hospital__c h : mapOfRecordsDeleted.values())
            {
                deletedRecordsId.add(h.Id);
                OwnerId.add(h.CreatedById);
            }
            system.debug('deletedRecordsId == '+deletedRecordsId);
            system.debug('deletedRecordsId == '+OwnerId);
            
            set<String> emailSet = new set<String>();
            For(User u:[SELECT Id, Email, Name FROM User WHERE Id=:OwnerId])
            {
                emailSet.add(u.Email);
            }
            
            //system.debug('userList == '+userList);
            //sendMailToRecordOwner(Null, emailSet, 'Your Record has been deleted Successfully', 'Record Deleted');
        }
    }
    public static void AfterUnDeleteDemo(Map<Id,Hospital__c> mapToDeleteRecords)
    {
        
        UtilityDemo.IsUndeleted = true;
        system.debug('I am in After UnDelete Demo');
    }
}