using Application.Project.VM;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MediatR;
using Domain.UnitOfWork;
using Application.Common.CQRSBase;
using Application.Common.Interfaces;
using AutoMapper;

namespace Application.Project.Queries;

public class GetProjectQuery : IRequest<IList<Domain.Entities.Project>>
{
    public class GetProjectHandler : CQRSBase, IRequestHandler<GetProjectQuery, IList<Domain.Entities.Project>>
    {
        public GetProjectHandler(IConfigConstants constant, IMapper mapper, IUnitOfWork unitOfWork, IDBConnection dbConnection)
            : base(constant, mapper, unitOfWork, dbConnection.ProjectTrackerConnection)
        {
        }

        public async Task<IList<Domain.Entities.Project>> Handle(GetProjectQuery request, CancellationToken cancellationToken)
        {
            var results = this.UnitOfWork.ProjectRepo.GetAllProjects();

            return await Task.Run(() => results, cancellationToken);
        }
    }
}