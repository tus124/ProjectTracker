using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Newtonsoft.Json.Linq;
using FluentValidation.Results;

namespace Application.Common.Exceptions
{
    public class ValidationException : Exception
    {
        public Newtonsoft.Json.Linq.JObject Failures { get; set; }
        public ValidationException() : base("One or more validation failures have occurred.")
        {
            this.Failures = new JObject();
        }
        public ValidationException(List<ValidationFailure> failures) : this()
        {
            var failuresMessages = string.Empty;
            var failureGroups = failures.GroupBy(f => f.PropertyName, e => e.ErrorMessage);

            foreach (var failureGroup in failureGroups)
            {
                var propertyName = failureGroup.Key;
                var propertyFailures = failureGroup.ToArray();

                failuresMessages += string.Join("<br>", propertyFailures) + "<br>";
            }

            failuresMessages = "{\"error\":\"" + failuresMessages + "\"}";
            this.Failures = JObject.Parse(failuresMessages);
        }
    }
}
