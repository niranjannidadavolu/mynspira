import { Pipe, PipeTransform } from '@angular/core';

@Pipe({
  name: 'indianCurrency'
})
export class IndiaCurrencyPipe implements PipeTransform {

  transform(amount: any, args?: any): string {
    if (amount !== null && !isNaN(amount)) {
      const currencySymbol = '₹ ';
      const decimalValue = this.getDecimalValue(amount.toString());
      const intergerValue = Math.floor(amount).toString().replace(/(\d)(?=(\d\d)+\d$)/g, '$1,');
      return currencySymbol + intergerValue + decimalValue;
    }
    return '';
  }

  getDecimalValue(amount: string): string {
    let decimal = '';
    if (amount.indexOf('.') > 0) {
      decimal = amount.substring(amount.indexOf('.'), amount.length);
      decimal = decimal.length === 2 ? decimal + '0' : decimal.substring(0, 3);
    } else {
      decimal = '.00';
    }
    return decimal;
  }
}