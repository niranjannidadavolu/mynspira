﻿using Phoenix.Application.Base;
using Phoenix.Model.Business.PMS;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Phoenix.Application.PMS.Interfaces
{
    public interface IAssignKRAApplication : IBaseApplication
    {
        Task<bool> AssignKraInformation(List<KraInformation> assignKRAInformation);
        Task<bool> AssignKraKpiInformation(List<AssignKraInformation> assignKRAKPIInformation, int createdBy, bool isDraft);
        Task<bool> AssignKraInformationToDesignation(List<KraInformation> assignKRAInformationToDesignation);
        Task<bool> AssignKraInformationToEmployee(List<KraInformation> assignKRAInformationToEmployee, int createdBy);
        Task<Tuple<List<KraInformation>, List<AssignKraInformation>>> GetAssignedKpiInformations(int departmentId, int designationId);
        Task<Tuple<List<KraInformation>, List<AssignKraInformation>>> GetAssignedKpiInformationsOfDesignation(int designationId);
        Task<Tuple<List<KraInformation>, List<AssignKraInformation>>> GetAssignedKpiInformationsForEmployee(int employeeSlno);
    }
}
