import { LightningElement, track } from 'lwc';

export default class ParentComponentEvent extends LightningElement {
    @track staffName;
    changeName(event)
    {
        console.log('I am in changeName method');
        console.log('Parameter passed is '+event.target.value);
        //this.staffName = event.target.value;
        this.template.querySelector('c-child-Component-Event').receiveData(event.target.value);
    }
}