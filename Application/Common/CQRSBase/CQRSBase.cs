using Application.Common.Interfaces;
using AutoMapper;
using Domain.UnitOfWork;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Application.Common.CQRSBase;

public class CQRSBase
{
    public IConfigConstants Constant { get; set; }
    public IMapper Mapper { get; set; }

    public IUnitOfWork UnitOfWork { get; set; }
    //public ICurrentUserService CurrentUserService { get; set; }

   // public ILogger Logger { get; set; }

    public CQRSBase(IConfigConstants constant, IMapper mapper, IUnitOfWork unitOfWork, string dbConnectionString)
    {
        this.Constant = constant;
        this.Mapper = mapper;
       // this.CurrentUserService = currentUserService;
       
        this.UnitOfWork = unitOfWork;
        //this.UnitOfWork.DbType = dbType;

        if(!string.IsNullOrEmpty(dbConnectionString))
        {
            this.UnitOfWork.ConnectionString = dbConnectionString;

        }
        this.UnitOfWork.Setup();
    }

    //public CQRSBase(IConfigConstants constant, IMapper mapper, IUnitOfWork unitOfWork, ICurrentUserService currentUserService, ILogger logger)
    //{
    //    this.Constant = constant;
    //    this.Mapper = mapper;
    //    this.CurrentUserService = currentUserService;
    //    this.Logger = logger;
    //    this.UnitOfWork = unitOfWork;
      
    //    this.UnitOfWork.Setup();
    //}
}
