namespace Domain.Entities;

public class ProjectResults
{
    public int Success { get; set; }

    public string SuccessMessage { get; set; }

    public int Failure { get; set; }

    public string FailureMessage { get; set; }
}
