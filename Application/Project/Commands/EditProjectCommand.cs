using Application.Common.CQRSBase;
using Application.Common.Interfaces;
using AutoMapper;
using Domain.Entities;
using Domain.UnitOfWork;
using MediatR;

namespace Application.Project.Commands;

public class EditProjectCommand : IRequest<ProjectResults>
{
    public Domain.Entities.Project Project { get; set; }

    public class EditProjectHandler : CQRSBase, IRequestHandler<EditProjectCommand, ProjectResults>
    {
        public EditProjectHandler(IConfigConstants constant, IMapper mapper, IUnitOfWork unitOfWork, IDBConnection dbConnection)
            : base(constant, mapper, unitOfWork, dbConnection.ProjectTrackerConnection)
        {
        }

        public async Task<ProjectResults> Handle(EditProjectCommand request, CancellationToken cancellationToken)
        {
            var results = this.UnitOfWork.ProjectRepo.EditProject(request.Project);

            return await Task.Run(() => results);
        }
    }
}