import { AbstractControl, ValidatorFn, ValidationErrors } from '@angular/forms';

// Custom validator function to check for special characters and leading spaces
export function SpecialCharacterAndLeadingSpaceValidator(): ValidatorFn {
  return (control: AbstractControl): ValidationErrors | null => {
    const value: string = control.value;

    if (!value) {
      // If the value is empty, consider it valid (you can adjust this based on your requirements)
      return !value ? { 'required': true } : null;
    }
    
    // Regular expression to match special characters
    const specialCharsRegex = /[!@#$%^&*(),.?":{}|<>]/;

    // Check if the value contains any special characters
    const hasSpecialChars = specialCharsRegex.test(value);

    // Check if the value starts with a space
    const startsWithSpace = /^\s/.test(value);

    // Return an error if special characters or leading spaces are found
    return hasSpecialChars || startsWithSpace ? { 'invalidInput': true } : null;
  };
}
