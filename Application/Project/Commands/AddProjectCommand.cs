using Application.Common.CQRSBase;
using Application.Common.Interfaces;
using AutoMapper;
using Domain.Entities;
using Domain.UnitOfWork;
using MediatR;

namespace Application.Project.Commands;

public class AddProjectCommand : IRequest<ProjectResults>
{
    public Domain.Entities.Project Project { get; set; }

    public class AddProjectHandler: CQRSBase, IRequestHandler<AddProjectCommand, ProjectResults>
    {
        public AddProjectHandler(IConfigConstants constant, IMapper mapper, IUnitOfWork unitOfWork, IDBConnection dbConnection)
            : base(constant, mapper, unitOfWork, dbConnection.ProjectTrackerConnection)
        {
        }

        public async Task<ProjectResults> Handle(AddProjectCommand request, CancellationToken cancellationToken)
        {
            var results = this.UnitOfWork.ProjectRepo.AddProject(request.Project);

            return await Task.Run(() => results);
        }
    }
}