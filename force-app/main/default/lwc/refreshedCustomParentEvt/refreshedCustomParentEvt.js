import { api, LightningElement, track } from 'lwc';

export default class RefreshedCustomParentEvt extends LightningElement {
    @track val;
    @track Childval;
    /*handleChildValue(event){
        console.log(' in handlechild value in parent component');
        const recVal = event.detail;
        console.log(' recVal == ',recVal);
        this.val = recVal;
        console.log('val === ',this.val);
    }*/
   constructor(){
       super();
       this.template.addEventListener('custevttest',this.handleMyData.bind(this));
    }

       handleMyData(event){
           console.log(' in handleMyData in parent component');
           const receivedVal = event.detail;
           this.Childval = receivedVal;
           console.log(' Childval == ',this.Childval);
       }   
}