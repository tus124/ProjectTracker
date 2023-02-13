using Domain.Repositories;

namespace Domain.UnitOfWork;
public interface IUnitOfWork
{

    //Properties
    string ConnectionString { get; set; }
    DbTypes DbType { get; set; }
    IUser User { get; set; }


    //Functions
    void Setup();
    void Commit();


    IProjectRepository ProjectRepo { get; set; }

}
