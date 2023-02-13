using Common.Data;
using Domain.Repositories;

namespace Infrastructure;

public class Repository : IRepository
{
    public SqlClient SqlTransaction { get; set; }

    public Repository(SqlClient sqlTransaction = null)
    {
        this.SqlTransaction = sqlTransaction;
    }

    public Repository()
    {
    }
}
