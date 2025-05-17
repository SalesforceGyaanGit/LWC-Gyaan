import { api, LightningElement } from 'lwc';

export default class RefreshedCustomChildEvt extends LightningElement {
        handleKeyChange(event) {
        event.preventDefault();
        const searchedVal = event.target.value;
        console.log('Searched Value is == ',searchedVal);

        const selectedNew = new CustomEvent('custevttest',{
            detail:searchedVal,
            bubbles: true            
        });
        this.dispatchEvent(selectedNew);
    }
}