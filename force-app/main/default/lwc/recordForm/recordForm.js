import { LightningElement } from 'lwc';
import ACCOUNT_OBJECT from "@salesforce/schema/Account";
import NAME_FIELD from "@salesforce/schema/Account.Name";
import WEBSITE_FIELD from "@salesforce/schema/Account.Website";
import Industry_FIELD from "@salesforce/schema/Account.Industry";
import Fax_FIELD from "@salesforce/schema/Account.Fax";

export default class RecordForm extends LightningElement {
    accountObject = ACCOUNT_OBJECT;
    myFields = [NAME_FIELD, WEBSITE_FIELD,Industry_FIELD,Fax_FIELD];

    handleAccountCreated() {
        // Run code when account is created.
    }
}