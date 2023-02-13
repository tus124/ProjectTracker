using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Domain.Repositories;
public interface IUser
{
    void Login(string userName);
    void Logout();
    void GetUser(string userName);
}
