using Application.Common.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Application.Common.Exceptions
{
    public class CommonApplicationException : Exception
    {
        public CommonApplicationException(string message, IConfigConstants constants) : base(constants.GeneralErrorMessage)
        {
        }
    }
}
