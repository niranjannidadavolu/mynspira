import { Injectable } from '@angular/core';
import * as CryptoJS from 'crypto-js';
import { environment } from 'src/environments/environment';

const TOKEN_KEY = 'auth-token';
const USER_KEY = 'auth-user';

@Injectable({
  providedIn: 'root'
})
export class StorageService {

  secretKey: any;

  constructor() {
    this.secretKey = environment.SecretKey;
  }

  signOut(): void {
    sessionStorage.clear();
  }

  public save(key: string, value: string, storageType: number): void {

    var encryptedData = CryptoJS.AES.encrypt(value, this.secretKey).toString();
    if (storageType === 1) {
      sessionStorage.removeItem(key);
      sessionStorage.setItem(key, encryptedData);
    }
    else if (storageType === 2) {
      localStorage.removeItem(key);
      localStorage.setItem(key, encryptedData);
    }
  }
  public get(key: string, storageType: number): string {
    if (storageType === 1) {
      let encryptedData = sessionStorage.getItem(key);
      if (encryptedData !== null || encryptedData != undefined) {
        return CryptoJS.AES.decrypt(encryptedData, this.secretKey).toString(CryptoJS.enc.Utf8);
      }
    }
    else if (storageType === 2) {
      let encryptedData = localStorage.getItem(key);
      if (encryptedData !== null || encryptedData != undefined) {
        return CryptoJS.AES.decrypt(encryptedData, this.secretKey).toString(CryptoJS.enc.Utf8);
      }
    }
    return '';
  }
  public remove(key: string, storageType: number) {
    
    if (storageType === 1) {
      sessionStorage.removeItem(key);
    }
    else if (storageType === 2) {
      localStorage.removeItem(key);
    }
  }

  public clear() {
    sessionStorage.clear();
    localStorage.clear();
  }

  public clearSessionStorage() {
    sessionStorage.clear();
  }

  public getParsedData(key: string, storageType: number): any {
    if (storageType === 1) {
      let encryptedData = sessionStorage.getItem(key);
      if (encryptedData !== null || encryptedData != undefined) {
        let data = CryptoJS.AES.decrypt(encryptedData, this.secretKey).toString(CryptoJS.enc.Utf8);
        if (data) {
          return JSON.parse(data);
        }
      }
    }
    else if (storageType === 2) {
      let encryptedData = localStorage.getItem(key);

      if (encryptedData !== null || encryptedData != undefined) {
        let data = CryptoJS.AES.decrypt(encryptedData, this.secretKey).toString(CryptoJS.enc.Utf8);
        if (data) {
          return JSON.parse(data);
        }
      }
    }
    return null;
  }
}
