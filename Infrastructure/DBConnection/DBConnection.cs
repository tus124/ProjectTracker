using Application.Common.Interfaces;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Infrastructure.DBConnection;

public class DBConnection : IDBConnection
{
    private readonly IConfigConstants configConstants;

    public string ProjectTrackerConnection => this.configConstants.ProjectTrackerConnection;


    public DBConnection(IConfigConstants configConstants)
    {
        this.configConstants = configConstants;
        //this.logger = logger;

        Configuration config = ConfigurationManager.OpenExeConfiguration(ConfigurationUserLevel.None);
        ConnectionStringsSection csSection = config.ConnectionStrings;
        config.AppSettings.Settings.Clear();

        csSection.ConnectionStrings.Add(new ConnectionStringSettings("ProjectTrackerConnection", configConstants.ProjectTrackerConnection));

        config.Save(ConfigurationSaveMode.Modified);
    }
}
