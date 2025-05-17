import { LightningElement, api, track } from 'lwc';

export default class MH_ObjectSearch_ShowPatientData extends LightningElement {
    
    @track PatientData;
    @track searchKeyVal;

    @api
    searchPatientData(searchKeyParam)
    {
        console.log('I am in searchPatientData');
        this.searchKeyVal = searchKeyParam;
        console.log('Param Received in Child component is --->',this.searchKeyVal);
    }
}