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
            return new List<Project>();
        }
    }

    public ProjectResults AddProject(Project project)
    {
        try
        {
            this.SqlTransaction.Command = "dbo.spProject_Insert";

            this.SqlTransaction.AddParameter("@Name", project.Name, System.Data.DbType.String, System.Data.ParameterDirection.Input);
            this.SqlTransaction.AddParameter("@Description", project.Description, System.Data.DbType.String, System.Data.ParameterDirection.Input);
            this.SqlTransaction.AddParameter("@Active", project.Active, System.Data.DbType.Boolean, System.Data.ParameterDirection.Input);
            this.SqlTransaction.AddParameter("@CreatedBy", project.CreatedBy, System.Data.DbType.String, System.Data.ParameterDirection.Input);

            this.SqlTransaction.CommandType = System.Data.CommandType.StoredProcedure;
            var results = this.SqlTransaction.Exec();
            this.SqlTransaction.Commit();

            ProjectResults pr = new ProjectResults();
            pr.Success = 1;
            pr.SuccessMessage = "Successfully Added";

            Console.WriteLine(results.ToString());

            return pr;
        }
        catch (Exception ex)
        {
            Console.WriteLine(ex.Message);
            ProjectResults pr = new ProjectResults();
            pr.Failure = 1;
            pr.FailureMessage = "Failed. " + ex.Message;

            return pr;
        }
    }

    public ProjectResults EditProject(Project project)
    {
        try
        {
            this.SqlTransaction.Command = "dbo.spProject_Update";

            this.SqlTransaction.AddParameter("@Id", project.Id, System.Data.DbType.Int32, System.Data.ParameterDirection.Input);
            this.SqlTransaction.AddParameter("@Name", project.Name, System.Data.DbType.String, System.Data.ParameterDirection.Input);
            this.SqlTransaction.AddParameter("@Description", project.Description, System.Data.DbType.String, System.Data.ParameterDirection.Input);
            this.SqlTransaction.AddParameter("@Active", project.Active, System.Data.DbType.Boolean, System.Data.ParameterDirection.Input);
            this.SqlTransaction.AddParameter("@ModifiedBy", project.ModifiedBy, System.Data.DbType.String, System.Data.ParameterDirection.Input);

            this.SqlTransaction.CommandType = System.Data.CommandType.StoredProcedure;
            var results = this.SqlTransaction.Exec();
            this.SqlTransaction.Commit();

            ProjectResults pr = new ProjectResults();
            pr.Success = 1;
            pr.SuccessMessage = "Successfully Updated";

            Console.WriteLine(results.ToString());

            return pr;
        }
        catch (Exception ex)
        {
            Console.WriteLine(ex.Message);
            ProjectResults pr = new ProjectResults();
            pr.Failure = 1;
            pr.FailureMessage = "Failed. " + ex.Message;

            return pr;
        }
    }


    public ProjectResults DeleteProject(int projectId)
    {
        try
        {
            this.SqlTransaction.Command = "dbo.spProject_Delete";

            this.SqlTransaction.AddParameter("@Id", projectId, System.Data.DbType.Int32, System.Data.ParameterDirection.Input);
           

            this.SqlTransaction.CommandType = System.Data.CommandType.StoredProcedure;
            var results = this.SqlTransaction.Exec();
            this.SqlTransaction.Commit();

            ProjectResults pr = new ProjectResults();
            pr.Success = 1;
            pr.SuccessMessage = "Successfully Deleted";

            Console.WriteLine(results.ToString());

            return pr;
        }
        catch (Exception ex)
        {
            Console.WriteLine(ex.Message);
            ProjectResults pr = new ProjectResults();
            pr.Failure = 1;
            pr.FailureMessage = "Failed. " + ex.Message;

            return pr;
        }
    }
}
