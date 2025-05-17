import { api, LightningElement, track } from 'lwc';

export default class RefreshedParentMethod extends LightningElement {
    @api searchInput;
    @api sendToChild;
    passInput(event){
        this.searchInput = event.target.value;
        console.log('Searched value is == ',this.searchInput);

        //Mention the method name of child component here, to which you have to pass the value
        this.template.querySelector('c-refreshed-child-method').receiveDataFromParent(this.searchInput);
    }

    passPropertyInput(event){
        this.sendToChild = event.target.value;
    }
}