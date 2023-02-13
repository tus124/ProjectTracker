using Application.Common.Interfaces;
using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Infrastructure.Constants;

public class ConfigConstants : IConfigConstants
{
    public IConfiguration Configuration { get; }


    public ConfigConstants(IConfiguration configuration)
    {
        this.Configuration = configuration;
    }

    public int LongRunningProcessMilliseconds => int.Parse(this.Configuration["AppSettings:LongRunningProcessMilliseconds"].ToString());

    public string GeneralErrorMessage => this.Configuration["AppSettings:GeneralErrorMessage"].ToString();

    public string ProjectTrackerConnection => this.Configuration["ConnectionStrings:ProjectTrackerConnectionString"].ToString();
}
