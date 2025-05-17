import { LightningElement, track, wire } from 'lwc';
import showHospitalRecords from '@salesforce/apex/HospitalInformation_Refreshed.showHospitalRecords';

const columns = [
    { label: 'Name', fieldName: 'Name' },
    { label: 'Hospital Name', fieldName: 'Hospital_Name__c'},
    { label: 'Located at', fieldName: 'City__c'},
    { label: 'Country', fieldName: 'Country__c'},
];
export default class SearchHospitalInfo extends LightningElement {
    columns = columns;
    InputString='';

    @track showtable = false;
    @track showDataTable = false;

    handleSearchInput(event){
        console.log('Inside handleSearchInput');
        this.InputString = event.target.value;
        //alert('Searched value is == '+this.InputString);
    }

    showTable(event){
        console.log('show table called');
        this.showDataTable = false;

        this.showtable = true;
        
    }
    showMyDataTable(event){
        console.log('show data table called');
        this.showtable = false;
        this.showDataTable = true;
        
    }

    //Example of Wire as a property
    @wire(showHospitalRecords, { searchVar: '$InputString'})
    listOfHospitalRecords;  
    
}