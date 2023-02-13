namespace WebApi.Controllers;

using Microsoft.AspNetCore.Mvc;
using System.Threading.Tasks;
using Application.Project.Queries;

public class ProjectController : ApiController
{
    [HttpGet]
    [Route("api/project/get")]
    public async Task<IActionResult> Get()
    {
        try
        {
            var results = await this.Mediator.Send(new GetProjectQuery());
            return this.Ok(results);
        }
        catch(Exception ex)
        {
            return this.Problem(ex.Message);
        }
    }

    //private readonly IProjectData _projectData;
    //private readonly IFeatureData _featureData;
    //private readonly IIssueData _issueData;
    //public ProjectController(IProjectData projectData, IFeatureData featureData, IIssueData issueData)
    //{
    //    _projectData = projectData;
    //    _featureData = featureData;
    //    _issueData = issueData;
    //}
    //public Task<IActionResult> Index()
    //{
    //    var results = await _projectData.GetProjects();
    //    return View(results.ToList());
    //}
}

internal interface IIssueData
{
}

internal interface IFeatureData
{
}

internal interface IProjectData
{
}