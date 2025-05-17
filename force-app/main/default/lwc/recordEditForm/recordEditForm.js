import { LightningElement, api } from 'lwc';
import Contact_Object from '@salesforce/schema/Contact';
import NAME_FIELD from '@salesforce/schema/Contact.Name';
export default class RecordEditForm extends LightningElement {
    fields = [NAME_FIELD];

    // Flexipage provides recordId and objectApiName
    @api recordId;
    @api objectApiName = Contact_Object;
}