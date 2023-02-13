using Common.Data;
using Domain.Entities;
using Domain.Repositories;

namespace Infrastructure.Repositories;

public class ProjectRepository : Repository, IProjectRepository
{
    public ProjectRepository(SqlClient sqlTransaction): base(sqlTransaction)
    {
    }

    public IList<Project> GetAllProjects()
    {
        try
        {
            this.SqlTransaction.Command = "dbo.spProject_GetAll";
            this.SqlTransaction.CommandType = System.Data.CommandType.StoredProcedure;
            var results = this.SqlTransaction.Query<Project>();
            return results.ToList();
        }
        catch (Exception ex)
        {
            Console.WriteLine(ex.Message);
            return null;
        }
    }
}
