using Domain.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Domain.Repositories;

public interface IProjectRepository
{
    IList<Project> GetAllProjects();

    ProjectResults AddProject(Project project);

    ProjectResults EditProject(Project project);

    ProjectResults DeleteProject(int id);
}
