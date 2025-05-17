import { LightningElement, track } from 'lwc';
import showPatientName from '@salesforce/apex/PatientInformation_Refreshed.showPatientName';

const Namecolumns = [
    { label: 'Patient Name', fieldName: 'Patient_Name__c' },
];
export default class PatientInformationComponent extends LightningElement {
    @track patientData;
    @track patientError;
    patientNameColumns = Namecolumns;
    @track showNames = false;
    handlePatientName(event){
        ('Handled patientName called ');
        showPatientName()
            .then(result => {
                this.patientData = result;
                this.patientError = undefined;
                this.showNames = true;

            })
            .catch(error => {
                this.patientError = error;
                this.patientData = undefined;
                this.showNames = false;
            });

    }
    
    handlePatientContact(event){
        alert('Handle Patient Contact called');
    }
    
}