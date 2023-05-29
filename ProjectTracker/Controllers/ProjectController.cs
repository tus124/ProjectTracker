namespace WebApi.Controllers;

using Microsoft.AspNetCore.Mvc;
using System.Threading.Tasks;
using Application.Project.Queries;
using Application.Project.Commands;
using Domain.Entities;

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


    [HttpPost]
    [Route("api/project/post")]
    public async Task<IActionResult> Post(Project _project)
    {
        try
        {
            var results = await this.Mediator.Send(new AddProjectCommand() { Project = _project});
            return this.Ok(results);
        }
        catch (Exception ex)
        {
            return this.Problem(ex.Message);
        }
    }

    [HttpPut]
    [Route("api/project/put")]
    public async Task<IActionResult> Put(Project _project)
    {
        try
        {
            var results = await this.Mediator.Send(new EditProjectCommand() { Project = _project });
            return this.Ok(results);
        }
        catch (Exception ex)
        {
            return this.Problem(ex.Message);
        }
    }

    [HttpDelete]
    [Route("api/project/delete")]
    public async Task<IActionResult> Delete(int _id)
    {
        try
        {
            var results = await this.Mediator.Send(new DeleteProjectCommand() { ProjectId = _id });
            return this.Ok(results);
        }
        catch (Exception ex)
        {
            return this.Problem(ex.Message);
        }
    }
}