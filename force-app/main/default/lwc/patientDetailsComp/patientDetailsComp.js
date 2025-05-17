import { LightningElement, api, track, wire } from 'lwc';
import fetchPatientInformation from "@salesforce/apex/PatientInformation.fetchPatientInformation";
const actions = [
    { label: 'Show details', name: 'show_details' },
    { label: 'Delete', name: 'delete' },
    { label: 'Personalized View', name:'show_per_view'},
];
const columns = [
    { label: 'Patient Name', fieldName: 'Patient_Name__c',editable: true},
    { label: 'Country', fieldName: 'Country__c'},
    { label: 'Contact', fieldName: 'Patient_Contact__c',editable: true},
    {
        type: 'action',
        typeAttributes: { rowActions: actions },
    },
];

export default class PatientDetailsComp extends LightningElement {
    @track patientData;
    @track searchKeyVal;
    @api receiveValFromParent;
    @track columns = columns;
    record = {};
    //@track data;

    @api
    searchPatientData(searchKeyParam)
    {
        console.log('I am in searchPatientData');
        this.searchKeyVal = searchKeyParam;
        console.log('Param Received in Child component is --->',this.searchKeyVal);
    }
    //@wire(fetchPatientInformation,{ searchKey: "$searchKeyVal" }) lstPatientRecords;  // wire as a property

    // Wire as Function
    @wire(fetchPatientInformation,{ searchKey: "$searchKeyVal" }) lstPatientInformationRecords({error,data})
    {
        if(data)
        {
            this.patientData = data;
            //this.data = data;
            this.patientErr = undefined;
        }
        else
        {
            this.patientData = undefined;
            this.patientErr = error;
        }
    }
    handleRowAction(event) {
        console.log('I am in handleRowAction');
        const actionName = event.detail.action.name;
        console.log('actionName is == '+actionName);
        const row = event.detail.row;
        console.log('row is == '+row);
        switch (actionName) {
            case 'delete':
                this.deleteRow(row);
                break;
            case 'show_details':
                this.showRowDetails(row);
                break;
            default:
        }    
    }
    deleteRow(row) {
        console.log('I am in deleteRow Method');
        const { id } = row;
        console.log('Id is ',row);
        const index = this.findRowIndexById(row);
        console.log('index is ',index);
        if (index !== -1) {
            console.log('I am in IF of deleteRow Method');
            this.data = this.data
                .slice(0, index)
                .concat(this.data.slice(index + 1));
        }
    }
    findRowIndexById(id) {
        console.log('I am in findRowIndexById Method');
        console.log('Id in findRowIndexById Method ==',id);
        let ret = -1;
        
        this.data.some((row, index) => {
            console.log('Index is == ',index);
            console.log('row is == ',row);
            if (row.id === id) {
                console.log( 'row.id is ',row.id);
                console.log( 'row.id is same as Id');
                ret = index;
                return true;
            }
            return false;
        });
        return ret;
    }
    showRowDetails(row) {
        console.log('I am in show Details');
        this.record = row;
    }
}