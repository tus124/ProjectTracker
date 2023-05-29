using Application.Common.CQRSBase;
using Application.Common.Interfaces;
using AutoMapper;
using Domain.Entities;
using Domain.UnitOfWork;
using MediatR;

namespace Application.Project.Commands;

public class DeleteProjectCommand : IRequest<ProjectResults>
{
    public int ProjectId { get; set; }

    public class DeleteProjectHandler : CQRSBase, IRequestHandler<DeleteProjectCommand, ProjectResults>
    {
        public DeleteProjectHandler(IConfigConstants constant, IMapper mapper, IUnitOfWork unitOfWork, IDBConnection dbConnection)
            : base(constant, mapper, unitOfWork, dbConnection.ProjectTrackerConnection)
        {
        }

        public async Task<ProjectResults> Handle(DeleteProjectCommand request, CancellationToken cancellationToken)
        {
            var results = this.UnitOfWork.ProjectRepo.DeleteProject(request.ProjectId);

            return await Task.Run(() => results);
        }
    }
}