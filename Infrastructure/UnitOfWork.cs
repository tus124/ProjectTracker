using Domain.Repositories;
using Domain.UnitOfWork;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Common.Data;
using Infrastructure.Repositories;

namespace Infrastructure;

public class UnitOfWork : IUnitOfWork
{
    public string ConnectionString { get; set; }
    public DbTypes DbType { get; set; }
    public IUser User { get; set; }
    public IProjectRepository ProjectRepo { get; set; }

    private SqlClient sqlTransaction;

    public UnitOfWork()
    {
    }



    public void Commit()
    {
        try
        {
            this.sqlTransaction.Commit();
        }
        catch
        {
            this.sqlTransaction.Rollback();
            throw;
        }
        finally
        {
            this.resetRepositories();
        }
    }

    public void Setup()
    {

        this.setupDb();
        
        this.ProjectRepo = new ProjectRepository(this.sqlTransaction);

    }

    private void setupDb()
    {
        if (this.ConnectionString != null)
        {
            this.sqlTransaction = new SqlClient(this.ConnectionString);
            this.sqlTransaction.BeginTransaction();

        }
    }

    private void resetRepositories()
    {
        this.ProjectRepo = null;
    }
}
