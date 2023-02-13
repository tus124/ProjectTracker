using Common.Data;

namespace Domain.Repositories;

public interface IRepository
{
    SqlClient SqlTransaction { get; set; }
}
