import { LightningElement, track, wire } from 'lwc';
import showHospitalStafRecords from '@salesforce/apex/HospitalInformation_Refreshed.showHospitalStafRecords';

const columns = [
    { label: 'Staff Name', fieldName: 'Staff_Name__c' },
    { label: 'Designation', fieldName: 'Staff_Designation__c'},
    { label: 'Gender', fieldName: 'Staff_Gender__c'},
    { label: 'Contact', fieldName: 'Staff_Contact__c'},
    { label: 'Date of Birth', fieldName: 'Staff_Dob__c'},
    { label: 'Age', fieldName: 'Staff_Age__c'},
    { label: 'Email', fieldName: 'Staff_Email__c'},

];

export default class SearchHospitalStaffInfo extends LightningElement {
    InputString='';
    @track staffRecords;
    @track RecordsErr;
    columns = columns;

    handleSearchInput(event){
        console.log('Inside handleSearchInput : searchHospitalStaffInfo component');
        this.InputString = event.target.value;
        //alert('Searched value is == '+this.InputString);
    }
    @wire(showHospitalStafRecords, { searchStaffVar: '$InputString'})
  staffRecords({ data, error }) {
    if (data) {
        this.staffRecords = data;
        this.RecordsErr = undefined;
      } else if (error) {
        this.RecordsErr = error;
        this.staffRecords = undefined;
      }
  }
}