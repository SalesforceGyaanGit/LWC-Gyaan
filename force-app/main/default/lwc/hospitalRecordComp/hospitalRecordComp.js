import { LightningElement, api, wire } from 'lwc';
import { getRecord,getFieldValue} from "lightning/uiRecordApi";

import NAME_FIELD from "@salesforce/schema/Hospital__c.Hospital_Name__c";

const FIELDS = [NAME_FIELD];
export default class HospitalRecordComp extends LightningElement {
    @api recordId;

    @wire(getRecord, { recordId: "$recordId", fields: FIELDS }) hosp;

  get hospName() {
    //return getFieldValue(this.account.data, NAME_FIELD);
    console.log('Name == ',getFieldValue(this.hosp.data, NAME_FIELD));
    //return this.hosp.data ? getFieldValue(this.hosp.data, FIELDS[0]) : '';  // if else 
    return getFieldValue(this.hosp.data, NAME_FIELD);

  }
}