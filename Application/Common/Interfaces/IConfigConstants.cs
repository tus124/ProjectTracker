namespace Application.Common.Interfaces;

public interface IConfigConstants
{
    int LongRunningProcessMilliseconds { get; }

    string GeneralErrorMessage { get; }

    string ProjectTrackerConnection { get; }
}
