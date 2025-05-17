import { LightningElement, track, wire } from 'lwc';
import welcomeuserLabel from '@salesforce/label/c.Welcome_User_Label'; // custom label
import Id from '@salesforce/user/Id';
import { getRecord } from 'lightning/uiRecordApi';
import UserNameFIELD from '@salesforce/schema/User.Name';
import getSObjectList from  '@salesforce/apex/UtilityDemo.getSObjectList';
import userEmailFIELD from '@salesforce/schema/User.Email';

export default class MediHealthSearchComp extends LightningElement {
    @track error;
    @track userId = Id;
    @track currentUserName;
    @track currentUserEmail;
    @track currentIsActive;
    @track currentUserAlias;
    @track options;

    label = {
        welcomeuserLabel,     // we can add more by separating with commas
    };
    
    @wire(getRecord, { recordId: Id, fields: [UserNameFIELD, userEmailFIELD]}) 
    currentUserInfo({error, data}) {
        if (data) {
            this.currentUserName = data.fields.Name.value;
            this.currentUserEmail = data.fields.Email.value;
        } else if (error) {
            this.error = error ;
        }
    }
    connectedCallBack() {
        this.getOptions();
      }
    
      getOptions() {
        getSObjectList({})
          .then((result) => {
             let options = [];
            if(result) {
              result.forEach(r => {
                options.push({
                  label: r,
                  value: r,
                });
              });
            }
            this.options = options;
          })
          .catch((error) => {
            // handle Error
          });
      }
    
    
}