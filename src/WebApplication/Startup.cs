// Copyright © 2015 Dmitry Sikorsky. All rights reserved.
// Licensed under the Apache License, Version 2.0. See License.txt in the project root for license information.

using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.DependencyInjection;

namespace WebApplication
{
  public class Startup : Platformus.WebApplication.Startup
  {
    public Startup(IHostingEnvironment hostingEnvironment)
      : base(hostingEnvironment)
    {
    }

    public override void ConfigureServices(IServiceCollection services)
    {
      base.ConfigureServices(services);
    }

    public override void Configure(IApplicationBuilder applicationBuilder, IHostingEnvironment hostingEnvironment)
    {
      base.Configure(applicationBuilder, hostingEnvironment);
    }
  }
}