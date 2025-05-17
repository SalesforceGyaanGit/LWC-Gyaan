import { LightningElement, api } from 'lwc';
//import Hospital_Object from '@salesforce/schema/Hospital__c';
import NAME_FIELD from '@salesforce/schema/Account.Name';
import { getRecord } from 'lightning/uiRecordApi';
export default class HospitalDetails extends LightningElement {
    fields = [NAME_FIELD];

    // Flexipage provides recordId and objectApiName
    @api recordId;
    //@api objectApiName;
    
    
}