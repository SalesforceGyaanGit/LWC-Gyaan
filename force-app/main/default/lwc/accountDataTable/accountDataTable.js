import { LightningElement, track, wire } from 'lwc';
import lstAccountRecs from '@salesforce/apex/AccountDetails.lstAccountRecs';
export default class AccountDataTable extends LightningElement {
    @track columns=
    [
        {
            label: 'Account Name',
            fieldName: 'Name',
            type: 'text'
        },
        {
            label: 'Fax',
            fieldName: 'Fax',
            type: 'Fax'
        },
        {
            label: 'Industry',
            fieldName: 'Industry',
            type: 'text'
        },
        {
            label: 'Website',
            fieldName: 'Website',
            type: 'url'
        },
    ];

    @track data;
    @track error;
    @track lstAccounts;
    @wire(lstAccountRecs) wiredlstData(
        {
            error,data
        })
        {
            if(data)
            {
                this.lstAccounts = data;
            }
            else
            {
                this.error = error;
            }
        }
}