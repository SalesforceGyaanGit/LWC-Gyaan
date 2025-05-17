import { LightningElement } from 'lwc';
import { publish } from 'c/pubsub';

export default class SearchComponentPubsub extends LightningElement {
    handleInput(event) {
        const searchText = event.target.value;
        publish('searchTextChanged', { query: searchText });
    }
}