import { LightningElement } from 'lwc';

export default class RenderingComponent1 extends LightningElement 
{
    ownerSName = "Prashant";
    websiteName;
    flag;
    changeOwner(event)
    {
        this.flag = event.target.checked;
        this.websiteName = 'www.salesforcegyaan.com';
        //flag = true;
    }
}