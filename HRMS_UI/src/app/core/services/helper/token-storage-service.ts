import { Injectable } from '@angular/core';
import { StorageService } from './storage-service';

const TOKEN_KEY = 'auth-token';
const USER_KEY = 'auth-user';
const REFRESH_TOKEN_KEY = 'auth-token-refresh';
const ROLE_TYPES = 'roleTypes';
const MAPPED_PERMISSIONS = 'MappedPermissions';

@Injectable({
  providedIn: 'root'
})
export class TokenStorageService {
  constructor(private readonly storageService: StorageService) { }
  signOut(): void {
    window.sessionStorage.clear();
  }
  public saveToken(token: string): void {
    this.storageService.save(TOKEN_KEY, token, 1);
  }
  public getToken(): string {
    return this.storageService.get(TOKEN_KEY, 1);
  }
  public saveRefreshToken(token: string): void {
    this.storageService.save(REFRESH_TOKEN_KEY, token, 1);
  }
  public getRefreshToken(): string {
    return this.storageService.get(REFRESH_TOKEN_KEY, 1);
  }
  public saveUser(user: any): void {
    this.storageService.save(USER_KEY, JSON.stringify(user), 1);
  }
  public getUser(): any {
    return JSON.parse(this.storageService.get(USER_KEY, 1));
  }
  getRoleTypes(): string {
    return this.storageService.get(ROLE_TYPES, 1);
  }
  setRoleTypes(roleTypes: string) {
    this.storageService.save(ROLE_TYPES, roleTypes, 1);
  }
  saveMappedPermissions(MappedPermissions: any) {
    this.storageService.save(MAPPED_PERMISSIONS, JSON.stringify(MappedPermissions), 1);
  }
  getMappedPermissions(): any {
    let mappedPermissions = JSON.parse(this.storageService.get(MAPPED_PERMISSIONS, 1));
    return mappedPermissions;
  }
  public clearToken() {
    this.storageService.remove(TOKEN_KEY, 1);
  }
  public clearUser() {
    this.storageService.remove(USER_KEY, 1);
  }
}