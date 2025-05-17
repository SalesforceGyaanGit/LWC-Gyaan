import { LightningElement, api, track, wire } from 'lwc';
import getfetchHospitalRecords from '@salesforce/apex/MB_HospitalObj.getfetchHospitalRecords';
import getHospitalStaffDetails from '@salesforce/apex/MB_HospitalObj.getHospitalStaffDetails';

export default class DecoratorsExample extends LightningElement {
    @api message = 'www.salesforcegyaan.com';  //Use of @api decorator 
    @wire(getfetchHospitalRecords) lstOfHospitalRecords; // Wire as a Property
    @track staffList;
    @track errorList;


    @wire(getHospitalStaffDetails) lstOfHospitalStaffRecords({data,error}) // Wire as a function
    {
        console.log('I am in getHospitalStaffDetails method');
        if(data)
        {
           this.staffList =  data;
        }
        else
        {
            this.errorList = error;
        }
    }


}