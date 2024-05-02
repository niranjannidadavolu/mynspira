import {  FormGroup } from "@angular/forms";

 export  class commonMethods{

    public static isNumberKey(evt:any) {
        const charCode = (evt.which) ? evt.which : evt.keyCode;
        if (charCode > 31 && (charCode < 48 || charCode > 57)) {
          return false;
        }
        return true;
    }

    public static ConvertToIndianRupee(amount: any) : any {
      return this.transform(amount)
      
    }
    
    private static transform(amount: any, args?: any): string {
      if (amount !== null && !isNaN(amount)) {
        const currencySymbol = '₹ ';
        const decimalValue = this.getDecimalValue(amount.toString());
        const intergerValue = Math.floor(amount).toString().replace(/(\d)(?=(\d\d)+\d$)/g, '$1,');
        return currencySymbol + intergerValue + decimalValue;
      }
      return '';
    }
  
    private static getDecimalValue(amount: string): string {
      let decimal = '';
      if (amount.indexOf('.') > 0) {
        decimal = amount.substring(amount.indexOf('.'), amount.length);
        decimal = decimal.length === 2 ? decimal + '0' : decimal.substring(0, 3);
      } else {
        decimal = '.00';
      }
      return decimal;
    }

    static dateLessThan(from: string, to: string) {
      return (group: FormGroup): {[key: string]: any} => {
       let f = group.controls[from];
       let t = group.controls[to];
       if (f.value > t.value) {
         return {
           dates: "Date from should be less than Date to"
         }; 
       }
       return {};
      }
    }

    static calculateDateDiff(fromDate:Date,toDate:Date) {
      var startDate = new Date(fromDate);
      var endDate = new Date(toDate);
      var time = endDate.getTime() - startDate.getTime();
      return time / (1000 * 3600 * 24)+1;
    }
}

