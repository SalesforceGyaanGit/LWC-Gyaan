import { LightningElement, api, track, wire } from 'lwc';
import { getRecord,getFieldValue} from "lightning/uiRecordApi";
import { createRecord } from 'lightning/uiRecordApi';
import { ShowToastEvent } from "lightning/platformShowToastEvent";
import NAME_FIELD from "@salesforce/schema/Hospital_Staff__c.Staff_Name__c";
import Email_FIELD from "@salesforce/schema/Hospital_Staff__c.Staff_Email__c";
import Leave_Application_Obj from "@salesforce/schema/Leave_Application__c";
import fromDate_field from "@salesforce/schema/Leave_Application__c.From_Date__c";
import EndDate_field from "@salesforce/schema/Leave_Application__c.Till_Date__c";
import reason_field from "@salesforce/schema/Leave_Application__c.Reason_for_Leave__c";
import hospitalId from "@salesforce/schema/Leave_Application__c.Hospital_Staff__c";

const FIELDS = [NAME_FIELD,Email_FIELD];
//const LeaveAppFields = [fromDate_field,EndDate_field,reason_field];

export default class LeaveApplicationPortal extends LightningElement {
    @track name;
    @api hidePortal;
    @api show;
    show = true;

    @api recordId;  // current page record Id (parent record Id)
    @track frmDate;
    @track toDate;
    @track leaveReason;

    @wire(getRecord, { recordId: "$recordId", fields: FIELDS }) StaffDeails;

    get sname()
    {
        //console.log('Name is',this.StaffDeails.data.fields.Staff_Name__c.value);
        //return this.StaffDeails.data.fields.Staff_Name__c.value;
        return getFieldValue(this.StaffDeails.data, NAME_FIELD);

    }
    get semail()
    {
        //console.log('Email is',this.StaffDeails.data.fields.Staff_Email__c.value);
        //return this.StaffDeails.data.fields.Staff_Email__c.value;
        return getFieldValue(this.StaffDeails.data, Email_FIELD);

    }

    @api
    handleParam(showData)
    {
        console.log('I am in handleParam');
        this.show = showData;
        console.log('Param Received in handle Param component is --->',this.show);
    }
    handleStaffName(event)
    {
        this.name = event.target.value;
    }
    applyCancel(event)
    {
        this.show = false;
        console.log('Hide portal value is ==',this.hidePortal);
    }
    handleFromDate(event)
    {
        this.frmDate = event.target.value;
        console.log('from Date is == ',this.frmDate);
    }
    handleTillDate(event)
    {
        this.toDate = event.target.value;
        console.log('to Date is == ',this.toDate);
    }
    handleReason(event)
    {
        this.leaveReason = event.target.value;
        console.log('Reason is == ',this.leaveReason);
    }
    applySubmitLeave()
    {
        const LeaveAppFields={};
        LeaveAppFields[fromDate_field.fieldApiName]=this.frmDate;
        LeaveAppFields[EndDate_field.fieldApiName]=this.toDate;
        LeaveAppFields[reason_field.fieldApiName]=this.leaveReason;
        LeaveAppFields[hospitalId.fieldApiName]=this.recordId;

        console.log('applySubmitLeave Method is called');
        //LeaveAppFields will be used here to map the records;
        const recInput = {apiName:Leave_Application_Obj.objectApiName,fields:LeaveAppFields}
        createRecord(recInput).then((record) => {
            console.log('Record is created == ',record);
            this.dispatchEvent(
                new ShowToastEvent({
                title: 'Success',
                message: 'Congrats ! Record is created successfully',
                variant: 'success',
            }));
        })
        .catch(error=>
            {
                console.log('Exception is generated');
                const evt = 
                new ShowToastEvent({
                    title: 'Error',
                    message: 'Ohh ! The error is generated',
                    variant: 'error',
                });
                this.dispatchEvent(evt);
            });
    }

    /*
        const fields={};
        fields[FROMDATE_FIELD.fieldApiName]=this.fromDate;
        fields[TILLDATE_FIELD.fieldApiName]=this.tillDate;
        fields[REASONFORLEAVE_FIELD.fieldApiName]=this.reason;
        fields[HOSPITALSTAFFNAME_FIELD.fieldApiName]=this.recordId;
    
    */
}