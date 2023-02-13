namespace Application.Common.Interfaces;

public interface ICurrentUserService
{
    string Account { get; }
    string HostAddress { get; }
}
