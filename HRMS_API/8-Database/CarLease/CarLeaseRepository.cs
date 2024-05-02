using Dapper;
using Dapper.Oracle;
using Microsoft.Extensions.Configuration;
using Phoenix.CrossCutting.Resources;
using Phoenix.Infrastructure.Dapper;
using Phoenix.Model.Business.CarLease;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Threading.Tasks;
using Phoenix.CrossCutting.Extension.System.Object.Convert.ToValueType;
using Phoenix.CrossCutting.Helper.ApplicationSettings;
using Phoenix.Infrastructure.BusinessModel;
using static Phoenix.CrossCutting.Enumerations.Enumerations;

namespace Phoenix.Database.Repository.CarLease
{
    public class CarLeaseRepository : BaseRepository
    {
        private readonly IConfiguration configuration;
        public CarLeaseRepository(IConfiguration configuration) : base(configuration)
        {
            this.configuration = configuration;
        }

        public async Task<List<CarLeaseBillName>> GetCarLeaseBillNames()
        {
            List<CarLeaseBillName> carLeaseBillName = null;
            string sqlQuery = "SELECT * FROM PAYROLLNEW.P_CAR_LEASE_MT WHERE CARLEASESLNO > 3";
            using (var connection = await base.CreateConnection(DbSchema.PORTAL))
            {
                OracleDynamicParameters parmeters = new OracleDynamicParameters();
                sqlQuery = string.Format(sqlQuery, "1");
                carLeaseBillName = (await connection.QueryAsync<CarLeaseBillName>(sqlQuery, commandType: CommandType.Text)).ToList();
            }
            return carLeaseBillName;
        }

        public async Task<List<CarLeaseMaintenanceBalance>> GetCarLeaseMaintenanceBalance(int empSLNo)
        {
            PagedResultSet<CarLeaseMaintenanceBalance> pagedResultSet = null;
            List<CarLeaseMaintenanceBalance> CarLeaseMaintenanceBalanceList = null;
            using (var connection = await base.CreateConnection(DbSchema.PORTAL))
            {
                OracleDynamicParameters parmeters = new OracleDynamicParameters();
                parmeters.Add(name: "iEMPLOYEESLNO", empSLNo, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                parmeters.Add(name: "DATACUR", dbType: OracleMappingType.RefCursor, direction: ParameterDirection.Output);
                CarLeaseMaintenanceBalanceList = (await connection.QueryAsync<CarLeaseMaintenanceBalance>(DatabaseProcedures.P_GET_EMP_CL_MAINTE_SELECT, parmeters, commandType: CommandType.StoredProcedure)).ToList();
            }
            return CarLeaseMaintenanceBalanceList;
        }
        public async Task<List<CarLeaseMaintenancePendingBills>> GetCarLeaseMaintenancePendingBills(int empSLNo)
        {          
            PagedResultSet<CarLeaseMaintenancePendingBills> pagedResultSet = null;
            List<CarLeaseMaintenancePendingBills> CarLeaseMaintenanceBalanceList = null;
            using (var connection = await base.CreateConnection(DbSchema.PORTAL))
            {
                OracleDynamicParameters parmeters = new OracleDynamicParameters();
                parmeters.Add(name: "iEMPLOYEESLNO", empSLNo, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                parmeters.Add(name: "DATACUR", dbType: OracleMappingType.RefCursor, direction: ParameterDirection.Output);

                CarLeaseMaintenanceBalanceList = (await connection.QueryAsync<CarLeaseMaintenancePendingBills>(DatabaseProcedures.P_GET_EMP_CL_MAINBILL_SELECT, parmeters, commandType: CommandType.StoredProcedure)).ToList();
            }
            return CarLeaseMaintenanceBalanceList;
        }

        public async Task<bool> UploadCarLeaseMaintenance(CarLeaseMaintenanceDetail uploadCarLeaseMaintenance)
        {
            OracleDynamicParameters parmeters = new();
            bool resp = false;
            int updatedParentRecords = 0;
            int updatedChildRecords = 0;

            using (var connection = await base.CreateConnection(DbSchema.PORTAL))
            {
                bool filsUploadStatus = await MainteneceUploadFileToDirectory(uploadCarLeaseMaintenance);
                if (filsUploadStatus)
                {
                    OracleDynamicParameters param = new();
                    param.Add(name: "iPBRANCHSLNO", uploadCarLeaseMaintenance.PBranchSLNo, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);                   
                    param.Add(name: "iEMPSLNO", uploadCarLeaseMaintenance.EmpSLNo, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                    param.Add(name: "iUNIQUENO", uploadCarLeaseMaintenance.UniqueNo, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                    param.Add(name: "iUSERSLNO", uploadCarLeaseMaintenance.UserSLNo, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                    param.Add(name: "oPARENTID", dbType: OracleMappingType.Int32, direction: ParameterDirection.Output);
                    updatedParentRecords = await connection.ExecuteAsync(DatabaseProcedures.SP_EMP_UPLD_CAR_LEASE, param, commandType: CommandType.StoredProcedure);
                    var parentId = param.Get<int>("oPARENTID");
                   
                        if(uploadCarLeaseMaintenance.File!=null)
                        {
                            OracleDynamicParameters parm = new();
                            parm.Add(name: "iPARENTID", parentId, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                            parm.Add(name: "iAMOUNT", uploadCarLeaseMaintenance.Amount, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                            parm.Add(name: "iFILENAME", uploadCarLeaseMaintenance.File.FileName, dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input);
                            parm.Add(name: "iFILEPATH", uploadCarLeaseMaintenance.FilePath, dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input);
                            parm.Add(name: "iHEADSLNO", uploadCarLeaseMaintenance.CarLeaseSLno, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                            parm.Add(name: "iBILLDATE", uploadCarLeaseMaintenance.BillDate, dbType: OracleMappingType.Date, direction: ParameterDirection.Input);
                            parm.Add(name: "iBILLNO", uploadCarLeaseMaintenance.BillNo, dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input);
                           updatedChildRecords = await connection.ExecuteAsync(DatabaseProcedures.SP_EMP_UPLD_CAR_LEASE_DDT, parm, commandType: CommandType.StoredProcedure);
                        }
                }

                resp = (updatedParentRecords * -1) > 0 && (updatedChildRecords * -1) > 0;
            }
            return resp;
        }

        public async Task<bool> DeleteMaintenenceBill(int recordId)
        {           
            using (var connection = await base.CreateConnection(DbSchema.PORTAL))
            {
                OracleDynamicParameters parmeters = new OracleDynamicParameters();
                parmeters.Add(name: "iRECORDID", recordId, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                var response=await connection.QueryAsync<bool>(DatabaseProcedures.P_DELETE_EMP_CL_MAINBILL, parmeters, commandType: CommandType.StoredProcedure);
            }
            return true;
        }

        #region Car Lease Agreement bill section

        public async Task<List<CarLeaseAgreementBills>> GetCarLeaseAgreementBills(int employeeSLNo)
        {
            List<CarLeaseAgreementBills> CarLeaseMaintenanceBalanceList = null;
            using (var connection = await base.CreateConnection(DbSchema.PORTAL))
            {
                OracleDynamicParameters parmeters = new OracleDynamicParameters();
                parmeters.Add(name: "iEMPLOYEESLNO", employeeSLNo, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                parmeters.Add(name: "DATACUR", dbType: OracleMappingType.RefCursor, direction: ParameterDirection.Output);

                CarLeaseMaintenanceBalanceList = (await connection.QueryAsync<CarLeaseAgreementBills>(DatabaseProcedures.P_GET_EMP_CL_AGREE_SELECT, parmeters, commandType: CommandType.StoredProcedure)).ToList();
            }
            return CarLeaseMaintenanceBalanceList;
        }

        public async Task<bool> UploadCarLeaseAgreementBill(List<CarLeaseAgreementBills> carLeaseAgreementBillUpload)
        {
            List<OracleDynamicParameters> parmeters = new();
            bool resp = false;

            using (var connection = await base.CreateConnection(DbSchema.PORTAL))
            {
                bool filsUploadStatus = await AgreementBillUploadFileToDirectory(carLeaseAgreementBillUpload);
                if (filsUploadStatus)
                {
                    carLeaseAgreementBillUpload.ForEach(agreement =>
                    {
                        OracleDynamicParameters param = new();
                        param.Add(name: "iEMPCARLEASEDDTSLNO", agreement.EmpCarLeasedDTSLNo, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                        param.Add(name: "iFILENAME", agreement.FileData.FileName, dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input);
                        param.Add(name: "iFILEPATH", agreement.FilePath, dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input);
                        param.Add(name: "iBILLNO", agreement.BillNo, dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input);
                        param.Add(name: "iBILLDATE", agreement.BillDate, dbType: OracleMappingType.Date, direction: ParameterDirection.Input);
                        param.Add(name: "iREMARKS", agreement.Remarks, dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input);
                        parmeters.Add(param);
                    });
                    await connection.ExecuteAsync(DatabaseProcedures.SP_EMP_CL_AGRE_BILLS_UPLOAD, parmeters, commandType: CommandType.StoredProcedure);
                }
                resp = true;
            }
            return resp;
        }

        private async Task<bool> AgreementBillUploadFileToDirectory(List<CarLeaseAgreementBills> carLeaseAgreementBills)
        {
            if (carLeaseAgreementBills != null && carLeaseAgreementBills.Count > 0)
            {
                foreach (var item in carLeaseAgreementBills)
                {
                    string filePath = Path.Combine(ApplicationSettings.Current.CarLeaseAgreementsPath, item.MonthSlNo.ToStringOrDefault());
                    if (!Directory.Exists(filePath))
                    {
                        Directory.CreateDirectory(filePath);
                    }
                    string fileType = Path.GetExtension(item.FileData.FileName).ToString().ToLower();
                    string fileName = string.Format("{4}{0}{1}{2}{3}", item.EmployeeSlno, item.BillNo, DateTime.Now.Ticks, fileType, item.EmployeeSlno);
                    filePath = Path.Combine(filePath, fileName);                    
                    if (!File.Exists(filePath))
                    {
                        string base64String = item.FileImage.Substring(item.FileImage.IndexOf(',') + 1);
                        byte[] imageBytes = Convert.FromBase64String(base64String);
                        File.WriteAllBytes(filePath, imageBytes);
                        item.FilePath = filePath;
                        item.FileData.FileName = fileName;
                    }
                }
            }
            return true;
        }

        private async Task<bool> MainteneceUploadFileToDirectory(CarLeaseMaintenanceDetail uploadCarLeaseMaintenance)
        {
            if (uploadCarLeaseMaintenance!=null)
            {
                
                    string filePath = Path.Combine(ApplicationSettings.Current.CarLeaseMaintenancePath);
                    if (!Directory.Exists(filePath))
                    {
                        Directory.CreateDirectory(filePath);
                    }
                    string fileType = Path.GetExtension(uploadCarLeaseMaintenance.File.FileName).ToString().ToLower();
                    string fileName = string.Format("{0}{1}{2}{3}{4}{5}", uploadCarLeaseMaintenance.EmpSLNo,uploadCarLeaseMaintenance.UniqueNo, uploadCarLeaseMaintenance.BillNo, DateTime.Now.Ticks, uploadCarLeaseMaintenance.EmpSLNo, fileType);
                    filePath = Path.Combine(filePath, fileName);

                    if (!File.Exists(filePath))
                    {
                        string base64String = uploadCarLeaseMaintenance.File.FileAsBase64.Substring(uploadCarLeaseMaintenance.File.FileAsBase64.IndexOf(',') + 1);
                        byte[] imageBytes = Convert.FromBase64String(base64String);
                        File.WriteAllBytes(filePath, imageBytes);
                    uploadCarLeaseMaintenance.FilePath = filePath;
                    uploadCarLeaseMaintenance.File.FileName = fileName;
                    }
                              
            }
            return true;
        }

        #endregion

    }
}
