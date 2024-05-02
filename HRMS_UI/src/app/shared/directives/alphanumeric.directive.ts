import { Directive, ElementRef, HostListener, Input } from '@angular/core';

@Directive({
  selector: 'input[alphanumericOnly]'
})
export class AlphanumericDirective {

  constructor(private _el: ElementRef) { }

  @HostListener('input', ['$event']) onInputChange(event: any) {
    const initalValue = this._el.nativeElement.value;
    this._el.nativeElement.value = initalValue.replace(/[^a-zA-Z0-9]*/g, '');
    if ( initalValue !== this._el.nativeElement.value) {
      event.stopPropagation();
    }
  }
//[A-Z]{5}[0-9]{4}[A-Z]{1}
}