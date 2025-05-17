import { LightningElement } from 'lwc';

export default class CalculatorExample extends LightningElement {
    showCalculator;
    Digit1;
    Digit2;
    Total;
    showCalci(event)
    {
        console.log('I am in showCalci Method');
        this.showCalculator = true;
        console.log('this.showCalculator ',this.showCalculator);
    }
    hideCalci(event)
    {
        console.log('I am in hideCalci Method');
        this.showCalculator = false;
        console.log('this.showCalculator ',this.showCalculator);
    }
    getDigit1(event)
    {
        console.log('I am in getDigit1 Method');
        this.Digit1 = event.target.value;
        console.log('Digit1 ',this.Digit1);
    }
    getDigit2(event)
    {
        console.log('I am in getDigit2 Method');
        this.Digit2 = event.target.value;
        console.log('Digit2 ',this.Digit2);
    }
    doAddition(event)
    {
        console.log('I am in doAddition Method');
        this.Total = parseInt(this.Digit1) + parseInt(this.Digit2);
    }
    doSubstraction(event)
    {
        console.log('I am in doSubstraction Method');
        this.Total = parseInt(this.Digit1) - parseInt(this.Digit2);
    }
    doMultiplication(event)
    {
        console.log('I am in doMultiplication Method');
        this.Total = parseInt(this.Digit1) * parseInt(this.Digit2);
    }
    doDivision(event)
    {
        console.log('I am in doDivision Method');
        this.Total = parseInt(this.Digit1) / parseInt(this.Digit2);
    }
}