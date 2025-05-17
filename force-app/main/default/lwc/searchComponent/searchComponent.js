import { LightningElement } from 'lwc';

export default class SearchComponent extends LightningElement {

    searchedKeyword;
    username;
    userpswd;

    hadleSearchInput(event){
        this.searchedKeyword = event.target.value;
    }
    handleUsername(event){
        this.username = event.target.value;
    }
    handlePassword(event){
        this.userpswd = event.target.value;
    }

    handleSubmit(event){
        console.log('Submit button is clicked');  // This works like system.debug in apex
        alert('Submit is clicked');
        alert('Username is == '+this.username+'Password is'+this.userpswd);
    }

}