namespace Application.Project.VM;

public class ProjectVM
{
    public IList<Domain.Entities.Project>? Projects { get; set; }

    public string ErrorMessage { get; set; }
}