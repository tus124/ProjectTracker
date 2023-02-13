using Application.Common.Interfaces;
using Domain.UnitOfWork;
using Infrastructure.Constants;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;


namespace Infrastructure;

public static class DependencyInjection
{
    public static IServiceCollection AddInfrastructure(this IServiceCollection services)
    {

        services.AddSingleton<IConfigConstants, ConfigConstants>();
        services.AddSingleton<IDBConnection, DBConnection.DBConnection>();
        services.AddSingleton<IUnitOfWork, UnitOfWork>();



        return services;
    }
}
