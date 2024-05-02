// This file can be replaced during build by using the `fileReplacements` array.
// `ng build` replaces `environment.ts` with `environment.prod.ts`.
// The list of file replacements can be found in `angular.json`.

export const environment = {
  production: false,
  ApplicationUrl: 'http://localhost:59487/api/',
  signalrHubUrl: 'http://localhost:59487/signalrhub',  //http://localhost:59487/  http://localhost:59487/signalrhub
  //ApplicationUrl: 'https://esspapi.narayanagroup.com/api/',
  //ApplicationUrl: 'http://localhost:8085/api',
  SecretKey :'66FC107444364B7EB904E57895629BDC',
  firebaseConfig: {
    apiKey: '',
    authDomain: '',
    databaseURL: '',
    projectId: '',
    storageBucket: '',
    messagingSenderId: '',
    appId: '',
    measurementId: ''
  }
};

/*
 * For easier debugging in development mode, you can import the following file
 * to ignore zone related error stack frames such as `zone.run`, `zoneDelegate.invokeTask`.
 *
 * This import should be commented out in production mode because it will have a negative impact
 * on performance if an error is thrown.
 */
// import 'zone.js/plugins/zone-error';  // Included with Angular CLI.
