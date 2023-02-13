namespace Application.Common.Behavior;

using Application.Common.Interfaces;
using MediatR;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;


public class RequestPerformanceBehavior<TRequest, TResponse> : IPipelineBehavior<TRequest, TResponse> where TRequest : MediatR.IRequest<TResponse>
{

    private readonly Stopwatch timer;
   // private readonly ILogger logger;
    private readonly IConfigConstants constant;
    //private readonly ICurrentUserService currentUserService;


    public RequestPerformanceBehavior(IConfigConstants constant/*, ILogger logger, ICurrentUserService currentUserService*/)
    {
        this.timer = new Stopwatch();
       // this.logger = logger;
        //this.currentUserService = currentUserService;
        this.constant = constant;
    }

    public async Task<TResponse> Handle(TRequest request, RequestHandlerDelegate<TResponse> next, CancellationToken cancellationToken)
    {
        this.timer.Start();
        var response = await next();
        this.timer.Stop();

        var elapsedMilliseconds = this.timer.ElapsedMilliseconds;

        if(elapsedMilliseconds > this.constant.LongRunningProcessMilliseconds)
        {
            var requestName = typeof(TRequest).Name;
            //var userName = AdAccount
            await Task.Run(() => request);
        }
        return response;
        
    }
}
