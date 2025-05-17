import { LightningElement, api, track } from 'lwc';

export default class ChildComponentEvent extends LightningElement {
    @track childStaffName;
    @api
    receiveData(myStaffName)
    {
        console.log('I am in receiveData');
        if(myStaffName)
        {
            this.childStaffName = myStaffName;
        }
        else
        {
            console.log('No name received by parent component');
        }
        console.log('Child staff Name == '+this.childStaffName);
    }
}