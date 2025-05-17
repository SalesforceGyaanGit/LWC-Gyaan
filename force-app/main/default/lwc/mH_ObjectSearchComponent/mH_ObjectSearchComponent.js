import { LightningElement, track, wire } from 'lwc';
import { loadStyle } from 'lightning/platformResourceLoader';
//import fetchPatientInformation from "@salesforce/apex/PatientInformation.fetchPatientInformation";
export default class MH_ObjectSearchComponent extends LightningElement {
    @track username = 'Prashant Sontakke';
    
    //@track searchInput;
    searchInput;
    @track patientData;
    @track patientErr;
    @track showPortal;
    @track show = true;

    handleSearchVal(event)
    {
        this.searchInput = event.target.value;
    }
    handleClick()
    {
        this.template.querySelector('c-patient-Details-Comp').searchPatientData(this.searchInput);  // Public Method : Parent to Child Communication
        
        /*fetchPatientInformation({ searchKey: this.searchInput })
        .then((result) => {
            this.patientData = result;
          })
          .catch((error) => {
            this.patientErr = error;
          });*/
    }
    //@wire(fetchPatientInformation,{ searchKey: "$searchInput" }) lstPatientRecords;  // wire as a property
    // Implementation of Wire as a function

    /*
    // Wire as Function
    @wire(fetchPatientInformation,{ searchKey: "$searchInput" }) lstPatientInformationRecords({error,data})
    {
        if(data)
        {
            this.patientData = data;
            this.patientErr = undefined;
        }
        else
        {
            this.patientData = undefined;
            this.patientErr = error;
        }
    }*/
    applyLeave(event)
    {
        this.showPortal = true;
        this.template.querySelector('c-leave-Application-Portal').handleParam(this.showPortal);  // Public Method : Parent to Child Communication
        
    }
    
}