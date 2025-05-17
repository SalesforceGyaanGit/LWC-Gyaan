import { LightningElement, api, wire } from 'lwc';
import { getRecord } from "lightning/uiRecordApi";

const FIELDS = ["Contact.Name", "Contact.Title", "Contact.Phone", "Contact.Email", "Contact.Is_Created__c"];
export default class DynamicContactRecordComp extends LightningElement {
    @api recordId;

  @wire(getRecord, { recordId: "$recordId", fields: FIELDS })
  contact;

  get name() {
    return this.contact.data.fields.Name.value;
  }
  get phone() {
    return this.contact.data.fields.Phone.value;
  }
  get email()
  {
    return this.contact.data.fields.Email.value;  
  }
  get isCreatedCheck() {
    return this.contact.data.fields.Is_Created__c.value;
  }
}