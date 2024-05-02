// Example async validator service
import { Injectable } from '@angular/core';
import { AbstractControl, ValidationErrors, AsyncValidator } from '@angular/forms';
import { Observable, of } from 'rxjs';
import { KraInformationService } from '../services/perfomance-management';
import { catchError, map } from 'rxjs/operators';

@Injectable({ providedIn: 'root' })
export class KraUniqueValidator implements AsyncValidator {
  constructor(private heroesService: KraInformationService) { }

  validate(
    control: AbstractControl
  ): Observable<ValidationErrors | null> {
    
    let anotherCtrl;
    const parent = control && control.parent;
    if (parent) {
      anotherCtrl = parent.get('KraSlno');
    }
    return this.heroesService.checkForDuplicacy(control.value, anotherCtrl?.value).pipe(
      map(exists => (exists ? { valueExists: true } : null)),
      catchError(() => of(null)) // Handle errors gracefully, for example, if the HTTP request fails);
  )}
}