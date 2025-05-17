import { LightningElement, track } from 'lwc';
import getfetchHospitalRecords from "@salesforce/apex/MB_HospitalObj.getfetchHospitalRecords";

export default class ImperativeComponent extends LightningElement {
 @track hospRecs;
 @track error;
 @track hideData;

 hideload(event)
 {
   console.log('I am in hideload');
   this.hideData = true;
   this.hospRecs = undefined;
 }

  handleLoad() {
    console.log('I am in handleLoad');
    getfetchHospitalRecords()
      .then((result) => {
        this.hospRecs = result;
        this.hideData = false;        
      })
      .catch((error) => {
        this.error = error;
      });
  }
  
}