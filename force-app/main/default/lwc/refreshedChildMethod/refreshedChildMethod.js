import { api, LightningElement, track } from 'lwc';

export default class RefreshedChildMethod extends LightningElement {
    @track searchedValue;

    @api
    receiveDataFromParent(searchVal){
        console.log('Value received in child == ',searchVal);
        this.searchedValue = 'Mr'+searchVal;
        console.log('Value received in child == ',this.searchedValue);   
    }
    multipleAccountCreation(){

    }
    deleteAccountRecords(){

    }
}