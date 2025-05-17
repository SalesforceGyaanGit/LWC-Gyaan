import { LightningElement } from 'lwc';
import { subscribe } from 'c/pubsub';
export default class ResultComponentPubsub extends LightningElement {
    resultText = '';

    connectedCallback() {
        subscribe('searchTextChanged', this.handleSearchText.bind(this));
    }

    handleSearchText(payload) {
        this.resultText = payload.query;
    }
}