using Dapper;
using Dapper.Oracle;

using Microsoft.Extensions.Configuration;

using Phoenix.CrossCutting.Resources;
using Phoenix.Infrastructure.Dapper;
using Phoenix.Model.Business.Employee;
using Phoenix.Model.Business.SendEmailNotification;

using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Threading.Tasks;

using static Phoenix.CrossCutting.Enumerations.Enumerations;

namespace Phoenix.Database.Repository.SendEmailNotification
{
    public class SendEmailRepository : BaseRepository
    {
        private readonly IConfiguration configuration;
        public SendEmailRepository(IConfiguration configuration) : base(configuration)
        {
            this.configuration = configuration;
        }

        public async Task<List<EmailDetails>> GetPendingEmails()
        {
            List<EmailDetails> emailList = null;
            using (var connection = await base.CreateConnection(DbSchema.PORTAL))
            {
                OracleDynamicParameters parameters = new OracleDynamicParameters();
                parameters.Add(name: "DATACUR", dbType: OracleMappingType.RefCursor, direction: ParameterDirection.Output);
                emailList = (await connection.QueryAsync<EmailDetails>(DatabaseProcedures.GET_SEND_EMAILS, parameters, commandType: CommandType.StoredProcedure)).ToList();
            }            
            return emailList;
        }
        public async Task<List<EmailDetails>> GetPendingEmails2()
        {
            List<EmailDetails> emailList = null;
            using (var connection = await base.CreateConnection(DbSchema.PORTAL))
            {
                OracleDynamicParameters parameters = new OracleDynamicParameters();
                parameters.Add(name: "DATACUR", dbType: OracleMappingType.RefCursor, direction: ParameterDirection.Output);
                emailList = (await connection.QueryAsync<EmailDetails>(DatabaseProcedures.GET_SEND_EMAILS2, parameters, commandType: CommandType.StoredProcedure)).ToList();
            }
            return emailList;
        }

        public async Task UpdateMailSentStatus(List<int> seletedLeaveIds)
        {
            using (var connection = await base.CreateConnection(DbSchema.PORTAL))
            {
                OracleDynamicParameters parameters = new OracleDynamicParameters();
                parameters.Add(name: "ILEAVE_EMAIL_IDS", seletedLeaveIds.ToArray(), dbType: OracleMappingType.Int32, direction: ParameterDirection.Input, seletedLeaveIds.Count,
                        collectionType: OracleMappingCollectionType.PLSQLAssociativeArray);
                await connection.ExecuteAsync(DatabaseProcedures.SP_UPDATE_MAIL_SENT, parameters, commandType: CommandType.StoredProcedure);
            }
        }
        public async Task UpdateSentMailStatus2(List<int> seletedLeaveIds)
        {
            using (var connection = await base.CreateConnection(DbSchema.PORTAL))
            {
                OracleDynamicParameters parameters = new OracleDynamicParameters();
                parameters.Add(name: "ILEAVE_EMAIL_IDS", seletedLeaveIds.ToArray(), dbType: OracleMappingType.Int32, direction: ParameterDirection.Input, seletedLeaveIds.Count,
                        collectionType: OracleMappingCollectionType.PLSQLAssociativeArray);
                await connection.ExecuteAsync(DatabaseProcedures.SP_UPDATE_SENT_MAIL_STATUS, parameters, commandType: CommandType.StoredProcedure);
            }
        }


        public async Task UpdateOTPMailSentStatus(List<int> seletedMailId)
        {
            using (var connection = await base.CreateConnection(DbSchema.PORTAL))
            {
                OracleDynamicParameters parameters = new OracleDynamicParameters();
                parameters.Add(name: "IOTP_EMAIL_IDS", seletedMailId.ToArray(), dbType: OracleMappingType.Int32, direction: ParameterDirection.Input, seletedMailId.Count,
                        collectionType: OracleMappingCollectionType.PLSQLAssociativeArray);
                await connection.ExecuteAsync(DatabaseProcedures.SP_UPDATE_OTP_MAIL_SENT, parameters, commandType: CommandType.StoredProcedure);
            }
        }

        public async Task<List<EmailOtpVerification>> GetPendingOTPEmails()
        {
            List < EmailOtpVerification> verificationDetails = null;
            using (var connection = await base.CreateConnection(DbSchema.PORTAL))
            {
                OracleDynamicParameters parameters = new OracleDynamicParameters();
                parameters.Add(name: "DATACUR", dbType: OracleMappingType.RefCursor, direction: ParameterDirection.Output);
                verificationDetails = (await connection.QueryAsync<EmailOtpVerification>(DatabaseProcedures.SP_SENT_EMAILOTP_VERIFICATION, parameters, commandType: CommandType.StoredProcedure)).ToList();
               
            }
           
            return verificationDetails;
        }

        //private async Task UpdateConsumedLeaves(int leaveEmailId)
        //{

        //    using (var connection = await base.CreateConnection(DbSchema.PORTAL))
        //    {
        //        OracleDynamicParameters parameters = new OracleDynamicParameters();
        //        parameters.Add(name: "iLEAVE_EMIAL_ID", leaveEmailId, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
        //        await connection.ExecuteAsync(DatabaseProcedures.SP_UPDATE_MAIL_SENT, parameters, commandType: CommandType.StoredProcedure);
        //    }
        //}
    }
}
