// Copyright © 2015 Dmitry Sikorsky. All rights reserved.
// Licensed under the Apache License, Version 2.0. See License.txt in the project root for license information.

using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Logging;

namespace WebApplication
{
  public class Startup : Platformus.WebApplication.Startup
  {
    public Startup(IHostingEnvironment hostingEnvironment, ILoggerFactory loggerFactory)
      : base(hostingEnvironment, loggerFactory)
    {
      loggerFactory.AddConsole();
    }

    public override void ConfigureServices(IServiceCollection services)
    {
      base.ConfigureServices(services);
    }

    public override void Configure(IApplicationBuilder applicationBuilder)
    {
      base.Configure(applicationBuilder);
    }
  }
}